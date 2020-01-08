library(dplyr)
library(tm)
library(topicmodels)
#1st corpus - a training non-lemmatized corpus which is a subset of the whole corpus. A training corpus has events by definition
corpus_test <-
  readLines(iconv('training_non-l.csv'),encoding='UTF-8')
corpus_test_proc <- Corpus(VectorSource(corpus_test))

#R stopwords in tm package are basically a subset of NLTK stopwords and not enough
stopwords_nltk <- c('olla', 'olen', 'olet', 'on', 'olemme', 'olette', 'ovat', 'ole', 'oli', 'olisi', 'olisit', 'olisin', 'olisimme', 'olisitte', 'olisivat', 'olit', 'olin', 'olimme', 'olitte', 'olivat', 'ollut', 'olleet', 'en', 'et', 'ei', 'emme', 'ette', 'eivät', 'minä', 'minun', 'minut', 'minua', 'minussa', 'minusta', 'minuun', 'minulla', 'minulta', 'minulle', 'sinä', 'sinun', 'sinut', 'sinua', 'sinussa', 'sinusta', 'sinuun', 'sinulla', 'sinulta', 'sinulle', 'hän', 'hänen', 'hänet', 'häntä', 'hänessä', 'hänestä', 'häneen', 'hänellä', 'häneltä', 'hänelle', 'me', 'meidän', 'meidät', 'meitä', 'meissä', 'meistä', 'meihin', 'meillä', 'meiltä', 'meille', 'te', 'teidän', 'teidät', 'teitä', 'teissä', 'teistä', 'teihin', 'teillä', 'teiltä', 'teille', 'he', 'heidän', 'heidät', 'heitä', 'heissä', 'heistä', 'heihin', 'heillä', 'heiltä', 'heille', 'tämä', 'tämän', 'tätä', 'tässä', 'tästä', 'tähän', 'tallä', 'tältä', 'tälle', 'tänä', 'täksi', 'tuo', 'tuon', 'tuotä', 'tuossa', 'tuosta', 'tuohon', 'tuolla', 'tuolta', 'tuolle', 'tuona', 'tuoksi', 'se', 'sen', 'sitä', 'siinä', 'siitä', 'siihen', 'sillä', 'siltä', 'sille', 'sinä', 'siksi', 'nämä', 'näiden', 'näitä', 'näissä', 'näistä', 'näihin', 'näillä', 'näiltä', 'näille', 'näinä', 'näiksi', 'nuo', 'noiden', 'noita', 'noissa', 'noista', 'noihin', 'noilla', 'noilta', 'noille', 'noina', 'noiksi', 'ne', 'niiden', 'niitä', 'niissä', 'niistä', 'niihin', 'niillä', 'niiltä', 'niille', 'niinä', 'niiksi', 'kuka', 'kenen', 'kenet', 'ketä', 'kenessä', 'kenestä', 'keneen', 'kenellä', 'keneltä', 'kenelle', 'kenenä', 'keneksi', 'ketkä', 'keiden', 'ketkä', 'keitä', 'keissä', 'keistä', 'keihin', 'keillä', 'keiltä', 'keille', 'keinä', 'keiksi', 'mikä', 'minkä', 'minkä', 'mitä', 'missä', 'mistä', 'mihin', 'millä', 'miltä', 'mille', 'minä', 'miksi', 'mitkä', 'joka', 'jonka', 'jota', 'jossa', 'josta', 'johon', 'jolla', 'jolta', 'jolle', 'jona', 'joksi', 'jotka', 'joiden', 'joita', 'joissa', 'joista', 'joihin', 'joilla', 'joilta', 'joille', 'joina', 'joiksi', 'että', 'ja', 'jos', 'koska', 'kuin', 'mutta', 'niin', 'sekä', 'sillä', 'tai', 'vaan', 'vai', 'vaikka', 'kanssa', 'mukaan', 'noin', 'poikki', 'yli', 'kun', 'niin', 'nyt', 'itse')
#After performing the topic modelling it was found that even NLTK stopwords are not enough
stopwords_topics <- c('myös','kuitenkin','saakka','vain', 'oma', 'omat','oman', 'omien', 'omia','omaa', 'eri','von','och','lisäksi','jälkeen','jälleen', 'muu', 'muut','muun','muassa','jolloin','kuten','vielä', 'aina', 'jopa','monia','asti','aina', 'varsinkin')
all_stopwords <- c(stopwords_nltk,stopwords_topics)

corpus_test_proc <- 
  corpus_test_proc %>%
  tm_map(tolower) %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeWords,all_stopwords) %>%
  tm_map(stripWhitespace)

set.seed(423)
doc_term_matrix_test <- DocumentTermMatrix(corpus_test_proc)
#The number of topics corresponds to the number of events extracted manually
model_test <- LDA(doc_term_matrix_test,20)

#Some problems with encoding arised
terms(model_test,20) %>%
  write.csv(file='terms_test.csv',fileEncoding = 'utf-8')
View(terms(model_test,20))

#2nd corpus - a training lemmatized corpus which is a subset of the whole corpus. A training corpus has events by definition
corpus_test_l <-
  readLines(iconv('training-l.csv'),encoding='UTF-8')
corpus_test_proc_l <- Corpus(VectorSource(corpus_test_l))

#R stopwords in tm package are basically a subset of NLTK stopwords and not enough
stopwords_nltk <- c('olla', 'olen', 'olet', 'on', 'olemme', 'olette', 'ovat', 'ole', 'oli', 'olisi', 'olisit', 'olisin', 'olisimme', 'olisitte', 'olisivat', 'olit', 'olin', 'olimme', 'olitte', 'olivat', 'ollut', 'olleet', 'en', 'et', 'ei', 'emme', 'ette', 'eivät', 'minä', 'minun', 'minut', 'minua', 'minussa', 'minusta', 'minuun', 'minulla', 'minulta', 'minulle', 'sinä', 'sinun', 'sinut', 'sinua', 'sinussa', 'sinusta', 'sinuun', 'sinulla', 'sinulta', 'sinulle', 'hän', 'hänen', 'hänet', 'häntä', 'hänessä', 'hänestä', 'häneen', 'hänellä', 'häneltä', 'hänelle', 'me', 'meidän', 'meidät', 'meitä', 'meissä', 'meistä', 'meihin', 'meillä', 'meiltä', 'meille', 'te', 'teidän', 'teidät', 'teitä', 'teissä', 'teistä', 'teihin', 'teillä', 'teiltä', 'teille', 'he', 'heidän', 'heidät', 'heitä', 'heissä', 'heistä', 'heihin', 'heillä', 'heiltä', 'heille', 'tämä', 'tämän', 'tätä', 'tässä', 'tästä', 'tähän', 'tallä', 'tältä', 'tälle', 'tänä', 'täksi', 'tuo', 'tuon', 'tuotä', 'tuossa', 'tuosta', 'tuohon', 'tuolla', 'tuolta', 'tuolle', 'tuona', 'tuoksi', 'se', 'sen', 'sitä', 'siinä', 'siitä', 'siihen', 'sillä', 'siltä', 'sille', 'sinä', 'siksi', 'nämä', 'näiden', 'näitä', 'näissä', 'näistä', 'näihin', 'näillä', 'näiltä', 'näille', 'näinä', 'näiksi', 'nuo', 'noiden', 'noita', 'noissa', 'noista', 'noihin', 'noilla', 'noilta', 'noille', 'noina', 'noiksi', 'ne', 'niiden', 'niitä', 'niissä', 'niistä', 'niihin', 'niillä', 'niiltä', 'niille', 'niinä', 'niiksi', 'kuka', 'kenen', 'kenet', 'ketä', 'kenessä', 'kenestä', 'keneen', 'kenellä', 'keneltä', 'kenelle', 'kenenä', 'keneksi', 'ketkä', 'keiden', 'ketkä', 'keitä', 'keissä', 'keistä', 'keihin', 'keillä', 'keiltä', 'keille', 'keinä', 'keiksi', 'mikä', 'minkä', 'minkä', 'mitä', 'missä', 'mistä', 'mihin', 'millä', 'miltä', 'mille', 'minä', 'miksi', 'mitkä', 'joka', 'jonka', 'jota', 'jossa', 'josta', 'johon', 'jolla', 'jolta', 'jolle', 'jona', 'joksi', 'jotka', 'joiden', 'joita', 'joissa', 'joista', 'joihin', 'joilla', 'joilta', 'joille', 'joina', 'joiksi', 'että', 'ja', 'jos', 'koska', 'kuin', 'mutta', 'niin', 'sekä', 'sillä', 'tai', 'vaan', 'vai', 'vaikka', 'kanssa', 'mukaan', 'noin', 'poikki', 'yli', 'kun', 'niin', 'nyt', 'itse')
#After performing the topic modelling it was found that even NLTK stopwords are not enough
stopwords_topics <- c('myös','kuitenkin','saakka','vain', 'oma', 'omat','oman', 'omien', 'omia','omaa', 'eri','von','och','lisäksi','jälkeen','jälleen', 'muu', 'muut','muun','muassa','jolloin','kuten','vielä', 'aina', 'jopa','monia','asti','aina', 'varsinkin')
all_stopwords <- c(stopwords_nltk,stopwords_topics)

corpus_test_proc_l <- 
  corpus_test_proc_l %>%
  tm_map(tolower) %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeWords,all_stopwords) %>%
  tm_map(stripWhitespace)

set.seed(423)
doc_term_matrix_test_l <- DocumentTermMatrix(corpus_test_proc_l)
#The number of topics corresponds to the number of events extracted manually
model_test_l <- LDA(doc_term_matrix_test_l,20)

#Some problems with encoding arised
terms(model_test_l,20) %>%
  write.csv(file='terms_test_l.csv',fileEncoding = 'utf-8')
View(terms(model_test_l,20))

#original separator was ',', but it led to problems in reading
#3rd corpus - the whole corpus
corpus <-
  'koko_korpus.csv' %>%  
  read.csv(fileEncoding='utf-8', sep='$',quote='')
corpus_proc <- Corpus(VectorSource(corpus$X.parag_value))

corpus_proc <- 
  corpus_proc %>%
  tm_map(tolower) %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeWords,all_stopwords) %>%
  tm_map(stripWhitespace)

set.seed(423)
doc_term_matrix <- DocumentTermMatrix(corpus_proc)
#The number of topics corresponds to the number of events extracted manually
model <- LDA(doc_term_matrix,20)

#Some problems with encoding arised
terms(model,20) %>%
  iconv(from='',to='latin1') %>%
  write.csv(file='terms_all.csv',fileEncoding = 'utf-8')
View(iconv(terms(model,20), from='',to='latin1'))