# NM simple launcher
# by fahmiyufrizal@2024

import os
import subprocess
from os import path
import sys
from sys import exit
import time
import pathlib
import click
import configparser
#import PySimpleGUI as sg
import dearpygui.dearpygui as dpg

# parameters
version = 'v1.0'
titlewindow = 'fahmiyufrizal@2024 [github.com/fahmiyufrizal]'
NMFN = (r'NetMarble_NetCafe_Launcher.exe')
NMLN = (r'_App_\ProgramFiles\Netmarble\Netmarble Launcher\Netmarble Launcher.exe')
dp0 = os.getcwd()
config_NM = path.expandvars(r'%appdata%\Netmarble Launcher')
dataconfig = (r'_App_\Roaming\Netmarble Launcher')

# create-registry
l1 = '@echo off\n'
l2 = r'reg import "%~dp0_Reg_\HKCU_SOFTWARE_Classes_netmarblelauncher.reg"'
l3 = r'reg import "%~dp0_Reg_\HKCU_Software_NetmarbleCorp.reg"'

#protection
if not path.exists (NMFN):
	print(" [x] Don't change filename!")
	time.sleep(5)
	sys.exit()

#window_init
os.system('title ' + titlewindow)
print(" ")
print("     Netmarble Launcher Netcafe      ")
print("     " + version)
print("     by fahmiyufrizal@2024        ")
print(" ")
print("     Special Thanks to : Diky Zakrana // Sena WaLker Wibowo // Ignatius Wisnu")
print("     Donate me at bit.ly/danain/fahmiyufrizal")
print(" ")
print("[+] Initializing....")
print("[+] Importing module & config...")

if __name__ == '__main__':
    cli()