* @ 10,50 SAY "imagenes\logo_inm_2.jpg" BITMAP ISOMETRIC SIZE _SCREEN.WIDTH * 0.15, _SCREEN.HEIGHT * 0.15

_SCREEN.ADDOBJECT("oImagen","Image")

WITH _Screen.oImagen
  lcPicture = "imagenes\logo_inm_2.jpg"		&& GETPICT()
  .PICTURE = lcPicture
   .STRETCH = 1 && 1=Mantiene las proporciones, 2=Cubre todo
  *-- Solo si la imagen tiene transparencia
  .BACKSTYLE = 0 && 0=Transparente, 1=Opaca
  .LEFT = 0
  .TOP = 0
  .WIDTH = _SCREEN.WIDTH
  .HEIGHT = _SCREEN.HEIGHT
  .ANCHOR = 15
  .VISIBLE = .T.
ENDWITH
