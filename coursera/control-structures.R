## control structures
# if-else
# for
# while
# repeat !
# break
# next !
# return 

if (TRUE) {
} else {
}

if (TRUE) {
} else if (FALSE) {
}

x <- if (T) {
  3
} else {
  4
}


for (i in 1:3) {
  print(i)
}

for (l in c(T, F, T)) 
  print(l)


x <- c("a", "b", "c")
for (i in seq_along(x)) {
  print(x[i])
}

m <- matrix(1:6, 2, 3)

for (i in seq_len(nrow(m))) {
  for (j in seq_len(ncol(m))) {
    print(m[i, j])
  }
}


count <- 0
while (count < 10) {
  print(count)
  count <- count+1
}

print('random walk')
z <- 5
while(z>=3 && z<=7) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if (coin==1) {
    z <- z+1
  } else {
    z <- z-1
  }
}

print('repeating')
count <- 1
repeat {
  print(count)
  count <- count + 1
  if (count > 10) {
    break
  }
}

print("skipping")
count <- 0
for (i in 1:100) {
  if (i <= 20) {
    next
  }
  count <- count + 1
}
assert(count == 80)

