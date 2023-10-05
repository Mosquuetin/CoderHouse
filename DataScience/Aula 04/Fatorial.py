import numpy as np

numero = 5
def fatorial(numero):
    lista = list(range(1,numero+1))
    x=1
    for n in lista:
        x = x * n
    print('O fatorial de '+str(numero)+' é '+str(x))
    
fatorial(numero)


numero = 100
def somatorio(numero):
    lista = list(range(1,numero+1))
    x=0
    for n in lista:
        x = x + n
    print('O somatorio de '+str(numero)+' é '+str(x))

somatorio(numero)


