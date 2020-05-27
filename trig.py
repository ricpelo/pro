import math

def Trig(angulo):
    TIPOS = ['RADIANES', 'GRADOS']
    tipo = TIPOS[0]

    def seno():
        return math.sin(angulo)

    def coseno():
        return math.cos(angulo)

    def get_angulo():
        return angulo

    def set_angulo(nuevo):
        nonlocal angulo
        angulo = nuevo

    def get_tipo():
        return tipo

    def set_tipo(nuevo):
        nonlocal tipo
        tipo = nuevo

    dic = {
        'seno': seno,
        'coseno': coseno,
        'get_angulo': get_angulo,
        'set_angulo': set_angulo,
        'get_tipo': get_tipo,
        'set_tipo': set_tipo
    }

    def despacho(mensaje):
        if mensaje in dic:
            return dic[mensaje]
        else:
            raise ValueError('Mensaje incorrecto')

    return despacho
