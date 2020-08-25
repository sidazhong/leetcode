import os

import gensim
from gensim.utils import simple_preprocess
from gensim.models.phrases import Phrases, Phraser
from gensim import corpora
from gensim.similarities import Similarity

from gensim.test.utils import common_corpus, common_dictionary
from gensim.sklearn_api import TfIdfTransformer
from gensim.parsing.porter import PorterStemmer

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
    demo = 6

    start_num = 0
    end_num = 1000*1000

    #fuzzy parameter
    fuzzy_similarity = 0.8

    #root directory
    ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

    #data set
    dataset = ROOT_DIR + '/dataset'

    #duplicate folder
    duplicate_document_path = ROOT_DIR + '/duplicate/test.txt'

    #inbox / sent document path
    all_document_path = {}

    ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
    source_document_path = ROOT_DIR+"/dataset/test1.txt"
    target_document_path = ROOT_DIR+"/dataset/test2.txt"
    log = ROOT_DIR+"/dataset/test3.txt"
    documents = [""] * 2

    def start(self):
        print("=========Start=========")

        count=0
        similarity=0
        if(self.demo==0):
            #get all inbox document path
            self.get_all_document()


            f = open(self.log, "a")

            #start compare the document
            for k in self.all_document_path:
                
                #compare target_document
                for kk in self.all_document_path:
                    count+=1
                    if(kk <= k):
                        continue

                    if(count<self.start_num):
                        continue

                    self.source_document_path = self.all_document_path[k]
                    self.target_document_path = self.all_document_path[kk]

                    similarity = self.compare()

                    if(similarity>=self.fuzzy_similarity):
                        print(self.source_document_path +'----'+self.target_document_path)
                        print("ID: " + str(kk) + " _________ similarity: " + str(similarity))
                        f.write(self.source_document_path +'----'+self.target_document_path +"\n")
                    
                    self.init()
                    if(count==self.end_num):
                        exit()
                        break

            f.close()


        if(self.demo==1 or self.demo==2 or self.demo==3 or self.demo==4 or self.demo==5 or self.demo==6):
            self.source_document_path = self.ROOT_DIR+"/dataset/test1.txt"
            self.target_document_path = self.ROOT_DIR+"/dataset/test2.txt"
            similarity = self.compare()
            print(similarity)
            exit()


        return similarity

    def compare(self):
        with open (self.source_document_path , encoding = "ISO-8859-1") as f:
            tokens = sent_tokenize(f.read())
            for line in tokens:
                self.documents[0] += line

        with open (self.target_document_path , encoding = "ISO-8859-1") as f:
            tokens = sent_tokenize(f.read())
            for line in tokens:
                self.documents[1] += line

        #bag of word
        texts = [[text for text in simple_preprocess(doc, deacc=True)] for doc in self.documents]

        #stemming
        p = PorterStemmer()
        for k in range(len(texts)):
            texts[k] = p.stem_documents(texts[k])

        #Reconvert documents to collection of words/bigrams
        bigram_phraser = Phrases(texts, min_count=1)
        texts_bigrams = [[text for text in bigram_phraser[ simple_preprocess(doc, deacc=True)]] for doc in self.documents]

        print(texts_bigrams)
        exit()

        # build N-gram
        texts_bigrams = [[]] * 2
        for k in range(len(texts)):
            texts_bigrams[k] = [""] * (len(texts[k])-1)
            for kk in range(len(texts[k])):
                if(kk<len(texts[k])-1):
                    texts_bigrams[k][kk]=texts[k][kk]+"_"+texts[k][kk+1]

        # remove most frequency word, stop word
        for k in range(len(texts)):
            word_counter = {}
            for word in texts_bigrams[k]:
                if word in word_counter:
                    word_counter[word] += 1
                else:
                    word_counter[word] = 1
            popular_words = sorted(word_counter, key = word_counter.get, reverse = True)
            top = popular_words[:3]
            for kk in range(len(top))[:]:
                texts_bigrams[k][:] = (value for value in texts_bigrams[k] if value != top[kk])



        #Create dictionary
        dictionary = corpora.Dictionary(texts_bigrams)

        #Create corpus
        corpus = [dictionary.doc2bow(docString) for docString in texts_bigrams]


        model = gensim.models.TfidfModel(corpus)  # fit model
        vector = model[corpus[0]] 

        #cosine similarity
        index = Similarity(corpus=corpus,num_features=len(dictionary),output_prefix='on_disk_output')

        for similarities in index:
            similar_docs = list(enumerate(similarities))
            break

        return similar_docs[1][1]


    def get_all_document(self):
        # loop all dataset folder
        count = 0
        for dataset_folder in glob.iglob(self.dataset + '**/misc.forsale', recursive=True):
            # loop all dataset folder
            for k in glob.iglob(dataset_folder + '**/*', recursive=True):
                #loop each inbox files
                self.all_document_path[count]=k
                count+=1


    def init(self):
        self.documents = [""] * 2
        self.source_document_path = ""
        self.target_document_path = ""

obj = deduplication()
similarity=obj.start()
print (similarity)
