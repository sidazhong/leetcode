#Import necessary gensim packages
# -*- coding: utf-8 -*-
import os

from nltk.tokenize import sent_tokenize

import gensim
from gensim.utils import simple_preprocess
from gensim.models.phrases import Phrases, Phraser
from gensim import corpora
from gensim.similarities import Similarity

from gensim.test.utils import common_corpus, common_dictionary
from gensim.sklearn_api import TfIdfTransformer
from gensim.parsing.porter import PorterStemmer

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
source_document_path = ROOT_DIR+"/dataset/test1.txt"
target_document_path = ROOT_DIR+"/dataset/test2.txt"

#Test dataset
documents = [""] * 2

with open (source_document_path) as f:
    tokens = sent_tokenize(f.read())
    for line in tokens:
        documents[0] += line

with open (target_document_path) as f:
    tokens = sent_tokenize(f.read())
    for line in tokens:
        documents[1] += line

#bag of word
texts = [[text for text in simple_preprocess(doc, deacc=True)] for doc in documents]

#stemming
p = PorterStemmer()
for k in range(len(texts)):
    texts[k] = p.stem_documents(texts[k])

#Reconvert documents to collection of words/bigrams
#texts_bigrams = [[text for text in bigram_phraser[ simple_preprocess(doc, deacc=True)]] for doc in documents]

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

#cosine similarity
index = Similarity(corpus=corpus,num_features=len(dictionary),output_prefix=ROOT_DIR + '/workspace/')

for similarities in index:
    similar_docs = list(enumerate(similarities))
    break


print(similar_docs[1][1])






