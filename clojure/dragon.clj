(defn turn-up [V]
  (let [[x y] V]
    [y (- x)]))

(defn turn-down [V]
  (vec (map - (turn-up V))))

(defn middle-up [L]
  (let [A (first L)
        B (second L)
        delta (map - B A)
        hdelta (map #(/ % 2) delta)
        thdelta (turn-up hdelta)
        C (vec (map + A hdelta thdelta))]
    C
    )
  )

(defn middle-down [L]
  (let [A (first L)
        B (second L)
        delta (map - B A)
        hdelta (map #(/ % 2) delta)
        thdelta (turn-down hdelta)
        C (vec (map + A hdelta thdelta))]
    C
    )
  )

(defn dragon-step [L]
  (conj (vec (reduce concat (for [corner (partition 3 2 L)]
    (let [[A B C] corner]
       [A (middle-up [A B]) B (middle-down [B C])]
    )))) (last L))
  )

(defn draw-dragon [gfx L]
  (for [l (partition 2 1 L)]
    (let [[A B] l
          [xa ya] A
          [xb yb] B]
      (.drawLine gfx xa ya xb yb)
      )
    )
  )

(def d2 (dragon-step [[250 300] [400 150] [550 300]]))

(def frame (java.awt.Frame.))

(.setSize frame (java.awt.Dimension. 600 600))

(.setVisible frame true)

(def gfx (.getGraphics frame))

(def d2-10 (nth (iterate dragon-step d2) 9))

(draw-dragon gfx d2-10)

(.clearRect gfx 0 0 600 600)
