# -*- coding: utf-8 -*-
#Import necessary gensim packages
from gensim.utils import simple_preprocess
from gensim.models.phrases import Phrases, Phraser
from gensim import corpora
from gensim.similarities import Similarity


class deduplication:
    documents = [
        #"Used SpaceX rocket as-is, buyer must transport.",
        #"Used SpaceX rocket as-is, buyer must transport.",
        #"For sale: bulk 100lbs pack of spaghetti noodles",
        #"Spaghetti noodles for sale — 100lbs bulk pack",
        "Pale blue tuxedo, used, good condition. Call 555–555–5555",
        "Brand new yellow tuxedo in great condition!"
    ]

    def start(self):
        self.word_of_bag()

    def word_of_bag(self):
        #Convert documents to collection of words
        texts = [[text for text in simple_preprocess(doc, deacc=True)] for doc in self.documents]

        #Build a bigram model to capture every pair of words in the texts
        bigram = Phrases(texts, min_count=1)
        bigram_phraser = Phraser(bigram)

        #Reconvert documents to collection of words/bigrams
        texts_bigrams = [[text for text in bigram_phraser[ simple_preprocess(doc, deacc=True)]] for doc in self.documents]

        #Create dictionary
        dictionary = corpora.Dictionary(texts_bigrams)

        #Create corpus
        corpus = [dictionary.doc2bow(docString) for docString in texts_bigrams]

        #Build similarity index
        index = Similarity(corpus=corpus,num_features=len(dictionary),output_prefix='on_disk_output')

        #Parse similarities from index
        doc_id = 0
        similar_docs = {}
        for similarities in index:
            similar_docs[doc_id] = list(enumerate(similarities))
            doc_id += 1

        #Setting a Cutoff Threshold
        sim_threshold = 0.1

        for doc_id, sim_doc_tuples in similar_docs.items():
            for sim_doc_tuple in sim_doc_tuples:
                sim_doc_id = sim_doc_tuple[0]
                sim_score = sim_doc_tuple[1]
                if sim_score >= sim_threshold and doc_id != sim_doc_id:
                    print("Found similar documents, score of:",sim_score)
                    print('\t', self.documents[doc_id])
                    print('\t', self.documents[sim_doc_id], '\n')



obj = deduplication()
obj.start()





































