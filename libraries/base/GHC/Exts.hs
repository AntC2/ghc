-----------------------------------------------------------------------------
-- |
-- Module      :  GHC.Exts
-- Copyright   :  (c) The University of Glasgow 2002
-- License     :  see libraries/base/LICENSE
-- 
-- Maintainer  :  cvs-ghc@haskell.org
-- Stability   :  internal
-- Portability :  non-portable (GHC Extensions)
--
-- GHC Extensions: this is the Approved Way to get at GHC-specific extensions.
--
-----------------------------------------------------------------------------

module GHC.Exts
       (
        -- * Representations of some basic types
        Int(..),Word(..),Float(..),Double(..),Integer(..),Char(..),

        -- * Primitive operations
        module GHC.Prim,
	shiftL#, shiftRL#, iShiftL#, iShiftRA#, iShiftRL#,

	-- * Fusion
	build, augment,

	-- * Linear implicit parameter support
	Splittable(..),

       ) where

import Prelude

import GHC.Prim
import GHC.Base
import GHC.Word
import GHC.Num
import GHC.Float

class Splittable t where
  split :: t -> (t,t)
