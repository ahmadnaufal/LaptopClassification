;
; RULE FORM GAMING USAGES
;
(deftemplate attribute (slot usage) (slot budget (type INTEGER)) (slot brand) (slot mobility) (slot design-type))


(deftemplate laptop (slot type)


; Rule 1: Gaming Usage, Budget Type 1 (under 5jt)
(defrule usage-gaming-budget1 "Digunakan untuk menentukan penggunaan laptop gaming"
   (attribute(usage "gaming"))
   (attribute(budget ?budget))
   (test(< ?budget 5000000))
   =>
   (assert (laptop (type "asus-x550dp")))
   (printout t "Berdasarkan pemilihan Laptop Gaming yang memiliki budget di bawah 5 juta, Laptop yang cocok adalah asus-x550dp.")
)


; Rule 2: Gaming Usage, Budget Type 2 (5jt - 7.5jt)
(defrule usage-gaming-budget2 "Digunakan untuk menentukan penggunaan laptop gaming"
   (attribute(usage "gaming"))
   (attribute(budget ?budget))
   (test(< ?budget 7500000))
   (test(>= ?budget 5000000))
   =>
   (assert (laptop (type "acer-e5-553g")))
   (printout t "Berdasarkan pemilihan Laptop Gaming yang memiliki budget di antara 5 hingga 7.5 juta, Laptop yang cocok adalah acer-e5-553g.")
)


; Rule 3: Gaming Usage, Budget Type 3 (7.5jt - 10jt)
(defrule usage-gaming-budget3 "Digunakan untuk menentukan penggunaan laptop gaming"
   (attribute(usage "gaming"))
   (attribute(budget ?budget))
   (test(< ?budget 10000000))
   (test(>= ?budget 7500000))
   =>
   (assert (laptop (type "asus-x550vx")))
   (printout t "Berdasarkan pemilihan Laptop Gaming yang memiliki budget di antara 7.5 hingga 10 juta, Laptop yang cocok adalah asus-x550vx.")
)


; Rule 4: Gaming Usage, Budget Type 4 (10jt - 15jt)
(defrule usage-gaming-budget4 "Digunakan untuk menentukan penggunaan laptop gaming"
   (attribute(usage "gaming"))
   (attribute(budget ?budget))
   (test(< ?budget 15000000))
   (test(>= ?budget 10000000))
   =>
   (assert (laptop (type "acer-e5-553g")))
   (printout t "Berdasarkan pemilihan Laptop Gaming yang memiliki budget di antara 10 hingga 15 juta, Laptop yang cocok adalah acer-e5-553g")
)


; Rule 5: Gaming Usage, Budget Type 5 (above 15jt), Mobility type 1 (high mobility)
(defrule usage-gaming-budget5-mobile1 "Digunakan untuk menentukan penggunaan laptop gaming"
   (attribute(usage "gaming"))
   (attribute(budget ?budget))
   (test(>= ?budget 15000000))
   (attribute(mobility "light"))
   =>
   (assert (laptop (type "msi-gs43vr")))
   (printout t "Berdasarkan pemilihan Laptop Gaming yang memiliki budget di atas 15 juta dan mobilitas tinggi (ringan), Laptop yang cocok adalah msi-gs43vr")
)


; Rule 6: Gaming Usage, Budget Type 5 (above 15jt), Mobility type 2 (medium mobility)
(defrule usage-gaming-budget5-mobile2 "Digunakan untuk menentukan penggunaan laptop gaming"
   (attribute(usage "gaming"))
   (attribute(budget ?budget))
   (test(>= ?budget 15000000))
   (attribute(mobility "medium"))
   =>
   (assert (laptop (type "msi-gs73vr")))
   (printout t "Berdasarkan pemilihan Laptop Gaming yang memiliki budget di atas 15 juta dan mobilitas standar, Laptop yang cocok adalah msi-gs73vr")
)


; Rule 7: Gaming Usage, Budget Type 5 (above 15jt), Mobility type 3 (low mobility)
(defrule usage-gaming-budget5-mobile3 "Digunakan untuk menentukan penggunaan laptop gaming"
   (attribute(usage "gaming"))
   (attribute(budget ?budget))
   (test(>= ?budget 15000000))
   (attribute(mobility "high"))
   =>
   (assert (laptop (type "msi-gt62vr")))
   (printout t "Berdasarkan pemilihan Laptop Gaming yang memiliki budget di atas 15 juta dan mobilitas rendah (berat), Laptop yang cocok adalah msi-gt62vr")
)


;
; RULE FOR OFFICE USAGES
;


; Rule 8: Office Usage, Budget Type 1 (under 3jt)
(defrule usage-office-budget1 "Digunakan untuk menentukan penggunaan laptop casual/office"
   (attribute(usage "office"))
   (attribute(budget ?budget))
   (test(< ?budget 3000000))
   =>
   (assert (laptop (type "asus-x200ca")))
   (printout t "Berdasarkan pemilihan Laptop Office yang memiliki budget di bawah 3 juta, Laptop yang cocok adalah asus-x200ca")
)


; Rule 9: Office Usage, Budget Type 2 (3jt - 5jt)
(defrule usage-office-budget2 "Digunakan untuk menentukan penggunaan laptop casual/office"
   (attribute(usage "office"))
   (attribute(budget ?budget))
   (test(< ?budget 5000000))
   (test(>= ?budget 3000000))
   =>
   (assert (laptop (type "asus-a445la")))
   (printout t "Berdasarkan pemilihan Laptop Office yang memiliki budget di antara 3 hingga 5 juta, Laptop yang cocok adalah asus-a445la")
)


; Rule 10: Office Usage, Budget Type 3 (5jt - 10jt)
(defrule usage-office-budget3 "Digunakan untuk menentukan penggunaan laptop casual/office"
   (attribute(usage "office"))
   (attribute(budget ?budget))
   (test(< ?budget 10000000))
   (test(>= ?budget 5000000))
   =>
   (assert (laptop (type "asus-vivobook-s300ca")))
   (printout t "Berdasarkan pemilihan Laptop Office yang memiliki budget di antara 5 hingga 10 juta, Laptop yang cocok adalah asus-vivobook-s300ca")
)


; Rule 11: Office Usage, Budget Type 4 (10jt - 15jt), Merek Apple
(defrule usage-office-budget4-apple "Digunakan untuk menentukan penggunaan laptop casual/office"
   (attribute(usage "office"))
   (attribute(budget ?budget))
   (test(< ?budget 15000000))
   (test(>= ?budget 10000000))
   (attribute(brand "apple"))
   =>
   (assert (laptop (type "macbook-air-md761zaa")))
   (printout t "Berdasarkan pemilihan Laptop Office yang memiliki budget di antara 10 hingga 15 juta dengan merk Apple, Laptop yang cocok adalah macbook-air-md761zaa")
)


; Rule 12: Office Usage, Budget Type 4 (10jt - 15jt), Merek Non Apple
(defrule usage-office-budget4-nonapple "Digunakan untuk menentukan penggunaan laptop casual/office"
   (attribute (usage "office"))
   (attribute (budget ?budget))
   (test (>= ?budget 10000000))
   (test (< ?budget 15000000))
   (attribute (brand "non-apple")
   =>
   (assert (laptop (type "sony-vaio-svf13n12sg")))
   (printout t "Berdasarkan pemilihan Laptop Office yang memiliki budget di antara 10 hingga 15 juta dengan merk selain Apple, Laptop yang cocok adalah sony-vaio-svf13n12sg")
)


; Rule 13: Office Usage, Budget Type 5 (above 15jt)
(defrule usage-office-budget5 "Digunakan untuk menentukan penggunaan laptop casual/office"
   (attribute (usage "office"))
   (attribute (budget ?budget))
   (test (>= ?budget 15000000))
   =>
   (assert (laptop (type "asus-taichi-21")))
   (printout t "Berdasarkan pemilihan Laptop Office yang memiliki budget di atas 15 juta, Laptop yang cocok adalah asus-taichi-21")
)


;
; RULE FOR MULTIMEDIA AND DESIGN USAGES
;


; Rule 14: Design Usage, Simple Design Type, Budget Type 1 (under 6jt)
(defrule usage-design-simple-budget1 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "simple"))
   (attribute (budget ?budget))
   (test (< ?budget 6000000))
   =>
   (assert (laptop (type "hp-15-ay011nr")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain sederhana yang memiliki budget di bawah 6 juta, Laptop yang cocok adalah hp-15-ay011nr")
)


; Rule 15: Design Usage, Simple Design Type, Budget Type 2 (6jt - 10jt)
(defrule usage-design-simple-budget2 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "simple"))
   (attribute (budget ?budget))
   (test (< ?budget 10000000))
   (test (>= ?budget 6000000))
   =>
   (assert (laptop (type "hp-pavilion-flagship")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain sederhana yang memiliki budget di antara 6 hingga 10 juta, Laptop yang cocok adalah hp-pavilion-flagship")
)


; Rule 16: Design Usage, Simple Design Type, Budget Type 3 (10jt - 15jt)
(defrule usage-design-simple-budget3 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "simple"))
   (attribute (budget ?budget))
   (test (< ?budget 15000000))
   (test (>= ?budget 10000000))
   =>
   (assert (laptop (type "macbook-air-mjve2lla")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain sederhana yang memiliki budget di antara 10 hingga 15 juta, Laptop yang cocok adalah macbook-air-mjve2lla")
)


; Rule 17: Design Usage, Simple Design Type, Budget Type 4 (above 15jt)
(defrule usage-design-simple-budget4 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "simple"))
   (attribute (budget ?budget))
   (test (>= ?budget 15000000))
   =>
   (assert (laptop (type "asus-zenbook-ux303ub")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain sederhana yang memiliki budget di atas 15 juta, Laptop yang cocok adalah asus-zenbook-ux303ub")
)


; Rule 18: Design Usage, 3D Design Type, Budget Type 1 (under 20jt)
(defrule usage-design-3d-budget1 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "3d"))
   (attribute (budget ?budget))
   (test (< ?budget 20000000))
   =>
   (assert (laptop (type "sager-np8268")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain 3 dimensi (3D Modelling) yang memiliki budget di bawah 20 juta, Laptop yang cocok adalah sager-np8268")
)


; Rule 19: Design Usage, 3D Design Type, Budget Type 2 (20jt - 40jt)
(defrule usage-design-3d-budget2 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "3d"))
   (attribute (budget ?budget))
   (test (< ?budget 40000000))
   (test (>= ?budget 20000000))
   =>
   (assert (laptop (type "msi-gt72")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain 3 dimensi (3D Modelling) yang memiliki budget di antara 20 hingga 40 juta, Laptop yang cocok adalah msi-gt72")
)


; Rule 20: Design Usage, 3D Design Type, Budget Type 3 (40jt - 65jt)
(defrule usage-design-3d-budget3 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "3d"))
   (attribute (budget ?budget))
   (test (< ?budget 65000000))
   (test (>= ?budget 45000000))
   =>
   (assert (laptop (type "aorus-x7-pro")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain 3 dimensi (3D Modelling) yang memiliki budget di antara 40 hingga 65 juta, Laptop yang cocok adalah aorus-x7-pro")
)


; Rule 21: Design Usage, 3D Design Type, Budget Type 4 (above 65jt)
(defrule usage-design-3d-budget4 "Digunakan untuk menentukan penggunaan laptop desain"
   (attribute (usage "design"))
   (attribute (design-type "3d"))
   (attribute (budget ?budget))
   (test (>= ?budget 65000000))
   =>
   (assert (laptop (type "sager-np9377s")))
   (printout t "Berdasarkan pemilihan Laptop untuk Desain 3 dimensi (3D Modelling) yang memiliki budget di atas 65 juta, Laptop yang cocok adalah sager-np9377s")
)
