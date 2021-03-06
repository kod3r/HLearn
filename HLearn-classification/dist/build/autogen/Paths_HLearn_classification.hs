module Paths_HLearn_classification (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/user/.cabal/bin"
libdir     = "/home/user/.cabal/lib/HLearn-classification-1.0.0/ghc-7.6.2"
datadir    = "/home/user/.cabal/share/HLearn-classification-1.0.0"
libexecdir = "/home/user/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "HLearn_classification_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HLearn_classification_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "HLearn_classification_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HLearn_classification_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
