library(magick)
irs_meme <- "inspo_meme3.png"
og_meme <- image_read(irs_meme)

# recreating the first text square
square_one <- image_blank(405, 100, "black") %>%
  image_annotate(text = "Chat with IRS opened",
                 color = "white",
                 size = 40,
                 font = "Impact",
                 gravity = "center"
                 )

# recreating the second text square
square_two <- image_blank(405, 100, "black") %>%
  image_annotate(text = "IRS: You owe me money",
                 color = "white",
                 size = 30,
                 font = "Sans",
                 gravity = "west"
                 )

# recreating the third text square
square_three <- image_blank(405, 100, "black") %>%
  image_annotate(text = "Me: Okay, how much?",
                 color = "white",
                 size = 30,
                 font = "Sans",
                 gravity = "east"
                 )

# recreating the fourth text square
square_four <- image_blank(405, 100, "black") %>%
  image_annotate(text = "IRS: Guess :p",
                 color = "white",
                 size = 30,
                 font = "Sans",
                 gravity = "west"
                 )

# recreating the fifth text square
square_five <- image_blank(405, 100, "black") %>%
  image_annotate(text = "Me: Uhh, $250?",
                 color = "white",
                 size = 30,
                 font = "Sans",
                 gravity = "east"
                 )

# recreating the sixth text square
square_six <- image_blank(405, 100, "black") %>%
  image_annotate(text = "IRS: Wrong D: jail",
                 color = "white",
                 size = 30,
                 font = "Sans",
                 gravity = "west"
                 )

# stacking the six squares on top of each other using a vector
square_vector <- c(square_one, square_two, square_three, square_four, square_five, square_six)
new_meme <- image_append(square_vector, stack = TRUE)

# showing the two memes side by side
meme_vector <- c(og_meme, new_meme)
image_append(meme_vector)

# saving the new meme
image_write(new_meme, "my_meme.png")

# making the frames for the animation
frame1 <- square_one
frame2 <- image_modulate(square_two, 100000, 100, 300)
frame3 <- image_flip(square_three)
frame4 <- image_blur(square_four, 4, 4)
frame5 <- image_oilpaint(square_five)
frame6 <- image_flop(square_six)

# frames vector in order
frames <- c(frame1, frame2, frame3, frame4, frame5, frame6)

# the gif made from the 6 frames
my_gif <- image_animate(frames, fps = 1)
image_write(my_gif, "my_animation.gif")









