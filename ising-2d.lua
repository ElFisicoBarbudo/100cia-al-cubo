math.randomseed(os.time())
print("**** ISING 2D METROPOLIS ****")
 
function init(N)
  mt = {}          -- create the matrix
  for i=0,N-1 do
    mt[i] = {}     -- create a new row
    for j=0,N-1 do
      if math.random()>0.5 then
        mt[i][j] = 1
      else
        mt[i][j] = -1
      end
    end
  end
  return mt
end

function simulacion(mt, N, T)
  for i=0,N-1 do
    for j=0,N-1 do
    a = math.random(0,N-1)
    b = math.random(0,N-1)
 
    if a-1<0 then
      an=N-1
    else
      an=a-1
    end
    if b-1<0 then
      bn=N-1
    else
      bn=b-1
    end
 
    nb = mt[math.mod(a+1,N)][b]+mt[a][math.mod(b+1,N)]+mt[an][b]+mt[a][bn]
   
    cost = 2*mt[a][b]*nb
    if cost < 0 then
      mt[a][b] = mt[a][b]*-1
    elseif math.random()<math.exp(-cost/T) then
      mt[a][b] = mt[a][b]*-1
    end
    end
  end  
end
 
function printmatrix(mt, N)
  for j=0,N-1 do
    print(bin(mt[0][j]),bin(mt[1][j]),bin(mt[2][j]),bin(mt[3][j]),bin(mt[4][j]),bin(mt[5][j]),bin(mt[6][j]),bin(mt[7][j]),bin(mt[8][j]),bin(mt[9][j]))
    end
end
 
function bin(i)
  if i == -1 then
    return 0
  else
    return 1
  end
end 
 
---------------------------------------------------------------------

 
print("Introduzca temperatura del sistema:")
local T = io.read()
 
print("Introduzca tamaño del sistema (por ahora solo funciona con 10 xd ):")
local N = io.read()
 
print("Introduzca numero de pasos en la simulación:")
local tf = io.read()
 
mt = init(N) -- Inicializando el sistema
printmatrix(mt, N)
 
for t=1,tf do
  print("  ")
  simulacion(mt, N, T)
  printmatrix(mt, N)
  --test(mt)
  print("Presiona ENTER para continuar la simulación")
  local x = io.read()
end
