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


def printLowercase(start=1):
  print(lowercase, end='')
  print()
  return

def printuppercase(start=1):
  print(uppercase, end='')
  print()
  return


def printWord(word):
  l = list(word)
  for letter in l:
    print(letter,uppercaseDict[letter])
    a = []
    # print(letter,uppercase[4])
