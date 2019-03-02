{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}

module Main where
import Paths_termReproducer (getDataFileName)
import qualified GI.Gtk as Gtk
import Data.GI.Base

main :: IO ()
main = do
  Gtk.init Nothing

  win <- new Gtk.Window [ #title := "Hi there" ]

  termonadIconPath <- getDataFileName "termonad-lambda.png"
  Gtk.windowSetDefaultIconFromFile termonadIconPath

  on win #destroy Gtk.mainQuit

  button <- new Gtk.Button [ #label := "Click me" ]

  on button #clicked (set button [ #sensitive := False,
                                   #label := "Thanks for clicking me" ])

  #add win button

  #showAll win

  Gtk.main
