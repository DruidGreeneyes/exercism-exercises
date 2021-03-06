module SpaceAge (Planet(..), ageOn) where
data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune

ageOn :: Planet -> Double -> Double
ageOn Mercury s = s / 7600543.81992
ageOn Venus s   = s / 19414149.052176
ageOn Earth s   = s / 31557600
ageOn Mars s    = s / 59354032.69008
ageOn Jupiter s = s / 374355659.124
ageOn Saturn s  = s / 929292362.8848
ageOn Uranus s  = s / 2651370019.3296
ageOn Neptune s = s / 5200418560.032
