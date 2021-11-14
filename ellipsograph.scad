module rounded_square(siz = 80, rad = 10){
    translate((siz/2 - rad) * [-1, -1])
        minkowski(){
            square(siz-2*rad);
            circle(rad);
        }
}

