Cls
Randomize Timer
Dim A(2000)
Screen 12

K = 0: N = 0
SI = 0: SJ = 0
KN = 10000: CR = 100: GR = 6
Y = 400

1
K = K + 1
S = 0
For I = 1 To CR
    X = Int(GR * Rnd) + 1
    S = S + X
Next I
A(S) = A(S) + 1
PSet (S - CR, Y - A(S))

If KN = K GoTo 2
If A(S) = Y GoTo 2
'DO: LOOP WHILE INKEY$ = ""
GoTo 1

2
For I = CR To GR * CR
    SI = SI + I
Next I
SA = SI / (GR * CR - CR)

For I = CR To GR * CR
    If A(I) = 0 GoTo 3
    N = N + 1
    SJ = SJ + (I - SA) ^ 2
    3
Next I
SD = Sqr(SJ / (GR * CR - CR))

Locate 28, 1: Print K, SA, SD, SD * SD, N

For I = 0 To GR * CR
    G = Exp((SA - I) * (I - SA) / (2 * SD * SD)) / (SD * Sqr(2 * 3.1415926))
    PSet (I - CR, Y - KN * G), 3
Next I
End

