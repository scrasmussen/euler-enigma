# example
import string

lowercase = []
uppercase = []
for i,letter in enumerate(string.ascii_lowercase, 1):
  lowercase.append([letter,i])
for i,letter in enumerate(string.ascii_uppercase, 1):
  uppercase.append([letter,i])
lowercaseDict = dict(lowercase)
uppercaseDict = dict(uppercase)


def printLowercase():
  print(lowercase, end='')
  print()
  return

def printuppercase():
  print(uppercase, end='')
  print()
  return


def printWord(word, add=0):
  l = list(word)
  for letter in l:
    print(letter,uppercaseDict[letter]+add)
