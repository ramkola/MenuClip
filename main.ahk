﻿;[MenuClip Clipboard Manager]

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

VERSION := "v1.6.1"
CONFIG_FILE_NAME := "config.ini"

#Include src\MenuClip.ahk

configManager := new MenuClip.ConfigManager(VERSION, CONFIG_FILE_NAME)
configManager.readAllConfigOptionsFromFile()

trayManager := new MenuClip.TrayManager(configManager)
trayManager.configureTrayTooltip()
trayManager.configureTrayOptions()

clipManager := new MenuClip.ClipManager(configManager)
clipManager.monitorClipboardChanges()

showMenu := ObjBindMethod(clipManager, "showContextMenu")
Hotkey, % configManager.getShowMenuHotkey(), % showMenu

return