(defun c:Villa2026 (/ p0 p1)
  (setvar "OSMODE" 0)
  (setvar "TEXTSIZE" 20)
  (setvar "CECOLOR" "256") ; ByLayer

  ;; --- PARTER (GROUND FLOOR) ---
  (setq p0 (list 0 0 0))
  
  ;; 1. Pereți Exteriori cu GOLURI (B)
  ;; Latura de jos (Intrare + Garaj)
  (command "_LINE" "0,0" "80,0" "")
  (command "_LINE" "280,0" "400,0" "") ; Gol ușa garaj
  (command "_LINE" "550,0" "1025,0" "") ; Gol ușa intrare

  ;; Latura dreapta (Living + Birou)
  (command "_LINE" "1025,0" "1025,500" "")
  (command "_LINE" "1025,700" "1025,1500" "") ; Gol fereastră living

  ;; Latura sus (Sera)
  (command "_LINE" "1025,1500" "800,1500" "")
  (command "_LINE" "400,1500" "0,1500" "") ; Gol spre Seră

  ;; Latura stânga
  (command "_LINE" "0,1500" "0,0" "")

  ;; Dublare pereți (Grosime 30cm)
  (command "_OFFSET" 30 (list 500 0 0) (list 500 30 0) "")

  ;; 2. SERA (Greenhouse) - Detaliată
  (command "_PLINE" "400,1500" "500,1650" "700,1650" "800,1500" "")
  (command "_TEXT" "500,1570" "15" "0" "Sera 9.7 mp")

  ;; 3. COMPARTIMENTARE INTERIOARĂ (A)
  (command "_LINE" "360,30" "360,600" "30,600" "") ; Garaj 15mp
  (command "_LINE" "30,1100" "375,1100" "375,1470" "") ; Bucătărie 12.1mp
  (command "_LINE" "650,30" "650,450" "995,450" "") ; Birou 14.6mp
  
  ;; Baia de la parter (4.0 mp)
  (command "_RECTANG" "250,600" "360,750")

  ;; 4. SCARA (U-Shape cu trepte)
  (let ((y 780))
    (repeat 6
      (command "_LINE" (list 30 y 0) (list 200 y 0) "")
      (setq y (+ y 25))))

  ;; 5. ETICHETE (Labels conform schiță)
  (command "_TEXT" "100,300" "20" "0" "GARAJ")
  (command "_TEXT" "80,1300" "20" "0" "BUCATARIE")
  (command "_TEXT" "600,900" "30" "0" "LIVING 35.5 mp")
  (command "_TEXT" "750,200" "20" "0" "BIROU")
  (command "_TEXT" "_J" "_MC" "512,-150" "40" "0" "PLAN PARTER")

  ;; --- ETAJ (FIRST FLOOR) ---
  (setq p1 (list 1300 0 0))
  (command "_RECTANG" p1 "@1025,1500")
  (command "_OFFSET" 30 (entlast) (list 1350 50 0) "")
  
  ;; Dormitoare Etaj
  (command "_LINE" "1812,30" "1812,1470" "") ; Separare stânga/dreapta
  (command "_LINE" "1812,750" "2325,750" "") ; Separare dormitoare dreapta
  
  (command "_TEXT" "1400,400" "20" "0" "Dormitor 1")
  (command "_TEXT" "1900,1000" "20" "0" "Dormitor 2")
  (command "_TEXT" "1900,300" "20" "0" "Dormitor 3")
  (command "_TEXT" "_J" "_MC" "1812,-150" "40" "0" "PLAN ETAJ")

  ;; --- COTE EXTERIOARE ---
  (command "_LINE" "0,-80" "1025,-80" "") ; Linie cotă jos
  (command "_TEXT" "_J" "_MC" "512,-120" "25" "0" "10.25 m")
  (command "_LINE" "-80,0" "-80,1500" "") ; Linie cotă stânga
  (command "_TEXT" "_J" "_MC" "-130,750" "25" "90" "15.00 m")

  (command "_ZOOM" "_E")
  (princ "\nGenerare completă Vila D-203 P finalizată.")
  (princ)
)