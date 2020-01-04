# A final project for the course "Introduction to Methods in Digital Humanities"

_Data_

For my research I have gathered data from BiographySampo portal via SPARQL-query. The data contains 49 biographies that were picked randomly from BiographySampo subset regarding Finnish university registries (Yliopistomatrikkelit), so the biographies of people who studied at the University of Helsinki were gathered. There are three corpora created from this data:

- the training corpus which consists of only such paragraphs that definitely have an event in them,

- the training corpus which was lemmatized (_new_corpus.csv_),

- the whole corpus (all paragraphs, not lemmatized - _koko_korpus.csv_).

_Processing the data_

The data was originally split into paragraphs with the help of SPARQL-query.

Lemmatization of the training corpus was done with the help of LAS:
http://demo.seco.tkk.fi/las/

I will clean up all three corpora with the help of R in the following steps:

1)    lowering the text,

2)    removing numbers,

3)    removing punctuation,

4)    removing stopwords,

5)    and removing extra spaces.

_Analyzing the data_

After performing the topic modeling the topics and the words identifying them will be analyzed and the conclusions about whether or not the topics are valid and will be made. Also, since there is a lemmatized training corpus, the results of the Topic Modeling performed on it will be compared to the results of other corpora, especially to the non-lemmatized training corpus.

_Problems_

One of the problems is a large amount of proper nouns that are usually present in biographies but are not present in biographies of different people which can affect the topic. The other problem is that topics may contain two or more events at the same time, because, according to the results of the close reading, in many cases the event is described with the help of one sentence, or there are many events even in the one sentence.
