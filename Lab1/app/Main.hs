module Main where

import           Control.Exception
import           Database.HDBC
import           Database.HDBC.PostgreSQL (connectPostgreSQL)

import           Source
import           Author
import           TextInfo
import           SourceTerms

main = do
  c <- connectPostgreSQL "host=localhost dbname=Lab1Haskell user=postgres password=postgres"
  
  putStrLn "Source start"

  allSources <- readAllSources c
  putStrLn "allSources: "
  print allSourcest

  newSourceId <- createSource "Article - IPS" c
  putStrLn "newSourceId: "
  print newSourceId

  newSource <- readSource c newSourceId
  putStrLn "newSource: "
  print newSource

  updateSource newSourceId "Article - SATR" c
  updatedSource <- readSource c newSourceId
  putStrLn "updatedSource: "
  print updatedSource

  successfullyDeletedSource <- deleteSource newSourceId c
  putStrLn "successfullyDeletedSource: "
  print successfullyDeletedSource

  allSources <- readAllSources c
  putStrLn "allSources: "
  print allSources

  emptySource <- readSource c newSourceId
  putStrLn "emptySource: "
  print emptySource

  newSourceId <- createSource "Article - IPS" c
  putStrLn "Source end"
  
  
  putStrLn "Author start"

  allAuthors <- readAllAuthors c
  putStrLn "allAuthors: "
  print allAuthors

  newAuthorId <- createAuthor "Daniel" "Lipsky" newSourceId c
  putStrLn "newAuthorId: "
  print newAuthorId

  newAuthor <- readAuthor c newAuthorId
  putStrLn "newAuthor: "
  print newAuthor

  updateAuthor newAuthorId "Oleh" "Hordey" newSourceId c
  updatedAuthor <- readAuthor c newAuthorId
  putStrLn "updatedAuthor: "
  print updatedAuthor

  successfullyDeletedAuthor <- deleteAuthor newAuthorId c
  putStrLn "successfullyDeletedAuthor: "
  print successfullyDeletedAuthor

  emptyAuthor <- readAuthor c newAuthorId
  putStrLn "emptyAuthor: "
  print emptyAuthor

  newAuthorId <- createAuthor "Daniel" "Lipsky" newSourceId c
  putStrLn "Author end"


  putStrLn "TextInfo start"

  allTextInfo <- readAllTextInfo c
  putStrLn "allTextInfo"
  print allTextInfo

  newTextInfoId <- createTextInfo "Biography" "new new new" newSourceId c
  putStrLn "newTextInfoId"
  print newTextInfoId

  newTextInfo <- readTextInfo c newTextInfoId
  putStrLn "newTextInfo"
  print newTextInfo

  updateTextInfo newTextInfoId "new2 new2 new2" "new22 new22 new22" newSourceId c
  updatedTextInfo <- readTextInfo c newTextInfoId
  putStrLn "updatedTextInfo"
  print updatedTextInfo

  successfullyDeletedTextInfo <- deleteTextInfo newTextInfoId c
  putStrLn "successfullyDeletedTextInfo"
  print successfullyDeletedTextInfo
  allTextInfo <- readAllTextInfo c
  putStrLn "allTextInfo"
  print allTextInfo

  emptyTextInfo <- readTextInfo c newTextInfoId
  putStrLn "emptyTextInfo"
  print emptyTextInfo
  putStrLn "TextInfo end"


  putStrLn "SourceTerms"

  allSourceTerms <- readAllSourceTerms c
  putStrLn "allSourceTerms"
  print allSourceTerms

  newSourceTermsId <- createSourceTerms "Rule3..." "parampampam" newSourceId c
  putStrLn "newSourceTermsId"
  print newSourceTermsId

  newSourceTerms <- readSourceTerms c newSourceTermsId
  putStrLn "newSourceTerms"
  print newSourceTerms

  updateSourceTerms newSourceTermsId "Rule4..." "parampampam2" newSourceId c
  updatedSourceTerms <- readSourceTerms c newSourceTermsId
  putStrLn "updatedSourceTerms"
  print updatedSourceTerms

  successfullyDeletedSourceTerms <- deleteSourceTerms newSourceTermsId c
  putStrLn "successfullyDeletedSourceTerms"
  print successfullyDeletedSourceTerms
  allSourceTerms <- readAllSourceTerms c
  putStrLn "allSourceTerms"
  print allSourceTerms

  emptySourceTerms <- readSourceTerms c newSourceTermsId
  putStrLn "emptySourceTerms"
  print emptySourceTerms

  putStrLn "SourceTerms"
