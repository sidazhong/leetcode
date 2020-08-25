# -*- coding: utf-8 -*-
import os

import gensim
from gensim.utils import simple_preprocess
from gensim.models.phrases import Phrases, Phraser
from gensim import corpora
from gensim.similarities import Similarity

import nltk
from nltk.tokenize import word_tokenize, sent_tokenize
from nltk.metrics.aline import np
from nltk.tokenize import word_tokenize
from nltk.tokenize import sent_tokenize
from nltk.corpus import stopwords

import numpy as np
from shutil import copyfile, move

import glob


class deduplication:
    demo = 0

    num = 100

    #fuzzy parameter
    fuzzy_similarity = 80

    #root directory
    ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

    #data set
    dataset = ROOT_DIR + '/dataset'

    #duplicate folder
    duplicate_document_path = ROOT_DIR + '/duplicate/test.txt'

    #dictionary
    dictionary = gensim.corpora.Dictionary([])

    #TF-IDF
    tf_idf = gensim.models.TfidfModel([])

    #all document path
    all_document_path = {}

    #source_document
    source_document_path = ""
    source_document = []

    #target_document
    target_document_path = ""
    target_document = []

    def init(self):

        #source_document
        self.source_dictionary=gensim.corpora.Dictionary([])
        self.source_tf_idf = gensim.models.TfidfModel([])
        self.source_document_path = ""
        self.source_document = []

        #target_document
        self.target_dictionary=gensim.corpora.Dictionary([])
        self.target_tf_idf = gensim.models.TfidfModel([])
        self.target_document_path = ""
        self.target_document = []

    def start(self):
        print("=========Start=========")

        count=0
        similarity=0
        if(self.demo==0):
            #get all inbox document path
            self.get_all_document()

            #start compare the document
            for k in self.all_document_path:
                
                #compare target_document
                for kk in self.all_document_path:
                    self.source_document_path = self.all_document_path[k]
                    self.target_document_path = self.all_document_path[kk]
                    if(kk <= k):
                        continue

                    count+=1
                    index_folder = self.build_source_document()
                    similarity = self.build_target_document(index_folder)
                    if(kk==self.num):
                        break

                    if(similarity>=100):
                        self.init()
                        continue
                    else:
                        print("=====================")
                        print(self.source_document_path +'----'+self.target_document_path)
                        print("ID: " + str(kk) + " _________ similarity: " + str(similarity))
                        self.init()

                exit()  


        if(self.demo==1 or self.demo==2 or self.demo==3 or self.demo==4 or self.demo==5 or self.demo==6):
            self.init()
            self.source_document_path = self.ROOT_DIR+"/dataset/test1.txt"
            self.target_document_path = self.ROOT_DIR+"/dataset/test2.txt"
            index_folder = self.build_source_document()
            similarity = self.build_target_document(index_folder)

            print(self.source_document_path +'----'+self.target_document_path)
            print(similarity)
            exit()


        return similarity

    def get_all_document(self):
        # loop all dataset folder
        count = 0
        for dataset_folder in glob.iglob(self.dataset + '**/*', recursive=True):
                # loop all dataset folder
                for customer_inbox in glob.iglob(dataset_folder + '**/inbox', recursive=True):
                    #loop each inbox files
                    for customer_inbox_document in glob.iglob(customer_inbox + '**/*', recursive=True):
                        self.all_document_path[count]=customer_inbox_document
                        count+=1



    #Retrieve the source document
    def build_source_document(self):
        with open (self.source_document_path) as f:
            tokens = sent_tokenize(f.read())
            for line in tokens:
                self.source_document.append(line)
                if(self.demo==1):
                    print(line)
            if(self.demo==1):
                exit()


        #Convert documents to collection of words
        gen_docs = [[text for text in simple_preprocess(text, deacc=True)] for text in self.source_document]

        #Build a bigram model to capture every pair of words in the texts
        bigram = Phrases(gen_docs,min_count=1, threshold=3)
        bigram_phraser = Phraser(bigram)
        #Reconvert documents to collection of words/bigrams
        texts_bigrams = [[text for text in bigram_phraser[ simple_preprocess(doc, deacc=True)]] for doc in self.source_document]
        if(self.demo==2):
            #print(texts_bigrams)
            stop_words = stopwords.words('english') 
            stop_words.extend(['from', 'subject', 're', 'edu', 'use'])
            exit()

        #Create dictionary
        self.source_dictionary = gensim.corpora.Dictionary(texts_bigrams)
        #create the "bag of word"
        corpus = [self.source_dictionary.doc2bow(gen_doc) for gen_doc in gen_docs]
        
        """
        gen_docs = [[w.lower() for w in word_tokenize(text)] for text in self.source_document]
        self.source_dictionary = gensim.corpora.Dictionary(gen_docs)
        corpus = [self.source_dictionary.doc2bow(gen_doc) for gen_doc in gen_docs]
        """

        if(self.demo==3):
            print(corpus)
            exit()

        #create the TF-IDF
        self.source_tf_idf = gensim.models.TfidfModel(corpus)
        if(self.demo==4):
            for doc in self.source_tf_idf[corpus]:
                print([[self.source_dictionary[id], np.around(freq, decimals=2)] for id, freq in doc])
            exit()

        #create the source index folder
        index_folder = gensim.similarities.Similarity(self.ROOT_DIR + '/workspace/',self.source_tf_idf[corpus],num_features=len(self.source_dictionary))
        return index_folder

    #Retrieve the target document
    def build_target_document(self,index_folder):
        with open (self.target_document_path) as f:
            tokens = sent_tokenize(f.read())
            for line in tokens:
                self.target_document.append(line)

        avg_sims = [] # array of averages
        # for line in query documents
        for line in self.target_document:
                """
                #Convert documents to collection of words
                query_doc = [[text for text in simple_preprocess(line, deacc=True)]]
                #Build a bigram model to capture every pair of words in the texts
                bigram = Phrases(query_doc,min_count=1, threshold=2)
                bigram_phraser = Phraser(bigram)
                #Reconvert documents to collection of words/bigrams
                texts_bigrams = [[text for text in bigram_phraser[ simple_preprocess(line, deacc=True)]]]
                #Create dictionary
                self.dictionary = corpora.Dictionary(texts_bigrams)
                #Create corpus
                query_doc_bow = [self.dictionary.doc2bow(docString) for docString in texts_bigrams]
                """

                #print(line + "---------------------")

                # tokenize words
                query_doc = [w.lower() for w in word_tokenize(line)]
                # create bag of words
                query_doc_bow = self.source_dictionary.doc2bow(query_doc)

                # find similarity for each document
                query_doc_tf_idf = self.source_tf_idf[query_doc_bow]

                # calculate sum of similarities for each query doc
                sum_of_sims =(np.sum(index_folder[query_doc_tf_idf], dtype=np.float32))
                # calculate average of similarity for each query doc
                avg = sum_of_sims / len(self.source_document)
                # print average of similarity for each query doc
                if(self.demo==5):
                    print(f'avg: {sum_of_sims / len(self.source_document)}')
                # add average values into array
                avg_sims.append(avg)  
                # calculate total average
                total_avg = np.sum(avg_sims, dtype=np.float)
                # round the value and multiply by 100 to format it as percentage
                percentage_of_similarity = round(float(total_avg) * 100)

        if(self.demo==5):
            exit()
        
        if(self.demo==6):
            print(percentage_of_similarity)
            exit()

        return percentage_of_similarity


obj = deduplication()
similarity=obj.start()
print (similarity)
