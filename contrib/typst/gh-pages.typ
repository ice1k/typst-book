#let heiti = ("Times New Roman", "Source Han Sans SC", "Source Han Sans TC", "New Computer Modern", "New Computer Modern Math")
#let songti = ("Times New Roman", "Source Han Serif SC", "Source Han Serif TC", "New Computer Modern", "New Computer Modern Math")
#let zhongsong = ("Times New Roman","STZhongsong", "SimSun", "New Computer Modern")

#import "@preview/typst-ts-variables:0.1.0": page-width, target

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "Typst Book", authors: (), body, width: page-width, target: target) = {
  // Set the document's basic properties.

  let style_color = rgb("#000")
  set document(author: authors, title: title)
  set page(
    numbering: none, 
    number-align: center,
    height: auto,
    width: width,
  )

  set page(margin: (top: 20pt, rest: 0pt)) if target == "web";

  set text(font: songti, size: 16pt, fill: style_color, lang: "en")

  // math setting
  show math.equation: set text(weight: 400)

  // code block setting
  show raw: it => {
    if it.block {
      rect(
        width: 100%,
        inset: (x: 4pt, y: 5pt),
        radius: 4pt,
        fill: rgb(239, 241, 243),
        [
          // set text(inner-color)
          #place(right, text(luma(110), it.lang))
          #it
        ],
      )
    } else {
      it
    }
  }

  // Main body.
  set par(justify: true)

  body
}
