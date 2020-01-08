# A final project for the course "Introduction to Methods in Digital Humanities"

[![DOI](https://zenodo.org/badge/220471862.svg)](https://zenodo.org/badge/latestdoi/220471862)

In my exploratory research I decided to investigate how Topic Modelling approach can be applied to the event categorization task. My idea was that some topics can be identified with the help of the keywords - namely verbs and nouns that together form a group (_toimia_ (to work) and noun that corresponds to some job, e.g. _lääkäri_ (doctor))

_Analysis_

Topics and words identifying them were analyzed and the conclusions about whether or not topics correspond to some events were made.

_Data_

For my research I have gathered data from BiographySampo portal via SPARQL-query. The data contains 49 biographies that were picked randomly from BiographySampo subset regarding Finnish university registries (_Yliopistomatrikkelit_), so the biographies of people who studied at the University of Helsinki were gathered. There are three corpora created from this data:

- the training corpus which consists of only such paragraphs that definitely have an event in them (356 sentences, _training_non-l.csv_),

- the training corpus which was lemmatized (356 sentences, _training-l.csv_),

- the whole corpus (all paragraphs, not lemmatized; 424 sentences, _koko_korpus.csv_).

_Processing the data_

The data was originally split into paragraphs with the help of SPARQL-query.

Lemmatization of the training corpus was done with the help of LAS:
http://demo.seco.tkk.fi/las/

All three corpora was cleaned with the help of the following pipeline:

1)    lowering the text,

2)    removing numbers,

3)    removing punctuation,

4)    removing stopwords,

5)    and removing extra spaces.

_Results_

Overall it seems that topics don't correspond to events. However, in some topics in training corpora events were clearly present:
1) In Topic 5 (a non-lemmatized corpus) there are 'toimi edustajana' (_worked as a representative_) and 'tuli dosentiksi' (_became a docent_). It's also hard to say whether these events are somehow interconnected, because these events may relate to different persons.
2) In Topic 1 (a lemmatized corpus) there are 'väitellä' + 'tohtori' (_get a PhD_) and 'saada' + 'nimitys' (_get an appointment_)

However, topics from the whole corpus don't seem to match any event.

Problems arised:
1. Despite removing all punctuation, there were still NA cells in topics.
