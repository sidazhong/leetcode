# -*- coding: utf-8 -*-
from gensim.models import Phrases

documents=["I am a good boy","Rahul Ghandhi will be next Prime Minister","APJ Abdul Kalam was an Indian scientist"]
sentence_stream = [doc.split(" ") for doc in documents]
#sentence_stream=brown_raw[0:10]
bigram = Phrases(sentence_stream, min_count=1, delimiter=b' ')
trigram  = Phrases(bigram[sentence_stream], min_count=1, delimiter=b' ')
for sent in sentence_stream:
    bigrams_ = [b for b in bigram[sent] if b.count(' ') == 1]
    trigrams_ = [t for t in trigram[bigram[sent]] 
                                          if t.count(' ')==2]
    print(bigrams_)
    print(trigrams_)

from nltk import ngrams


Sentences="I am a good boy . Rahul Ghandhi will be next Prime Minister . APJ Abdul Kalam was an Indian scientist "
bigram=list(ngrams(Sentences.lower().split(),2))
trigram=list(ngrams(Sentences.lower().split(),3))
fourgram=list(ngrams(Sentences.lower().split(),4))
