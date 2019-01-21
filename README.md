# The non-official PhD thesis template for Engineering and Public Policy (EPP) at Carnegie Mellon University (CMU).

## Quick Instructions

1. Download the zip file by clicking on the 'Download ZIP' button, to the right column. Uncompress the file.
1. Edit the files referenced below in "Important files" to suit your needs.
1. Open a terminal, go to the folder where you uncompressed the zip file, and type `make`. If everything goes fine, you should see soon the file 'thesis.pdf'. To clean up the folder, type `make clean`.

## Not-so-quick instructions

### Foreword

During 2013 I spent quite a while trying to understand the multiple requirements to put together my PhD thesis for Engineering and Public Policy (EPP) at Carnegie Mellon University (CMU).  Besides having many tables, lots of questions coming from surveys, graphics, statistical data, and a lot of code to put in, I also had to deal with a lot of editorial requirements (e.g., "*this is how* your cover page should look like").  Since there are no official templates for a phd thesis (which makes no sense to me since it's something we all PhD students have to go through), here's my attempt to save you the pain to do it.

This template (actually, a set of files needed to give structure to the thesis) has a lof of filler texts, just to give you an example of how to structure your own thesis document. You can safely remove most of the texts.

While there are surely many ways to do what I have done in this template, I strongly suggest that you create a set of rules for yourself and stick to them firmly (e.g., putting each chapter in a separate folder, naming all the images in a certain way, etc.) Writing your thesis can be very stressful, and many things can go wrong in stressful times (like deleting important files unrecoverably).

The most important two pieces of advice that I can give for writing your thesis document are:

1. **Back up everything twice out of your own computer**.
1. **Be organized**.

### Important files

1. *thesis.tex*: This is the main file of your thesis. It contains references to all your chapters, appendices, and other needed commands.
1. *content/frontmatter.tex*: This is where most of the details go: the title of your thesis, your own name, your degrees (which should go in your cover page), the date of your graduation, copyright permission, keywords of your thesis, your abstract, dedication, and acknowledgements.
1. *content/macros.tex*: This is where you put all the special LaTeX packages that you need, and all those definitions that are repeated all over your work, but that nonetheless may change often.
1. *content/references.bib*: This is where your bibliographic references go (BibTeX format).

Except for these files, you should not need to change any other files.

### How to structure your thesis

The starting file for your thesis is thesis.tex. This file includes references to the chapters and main files. Some lines in this file are not meant to be changed, others are.  The file is commented to indicate what you should change.

In this template, all the content belonging to a chapter has been put into a separate folder (a "chapter folder"). There is one folder (chp-main) that contains the "special" chapters: Introduction, Related Work and Conclusions, but if you don't like this you may tweak it as you please.

Each chapter folder has two subfolders: `images/` and `content/`. The first one is meant to contain all the images included in that chapter.  The second one is meant to contain latex snippets that will actually embed images or other graphical files into your thesis.

Each chapter folder contains one file with the body of the chapter; which in this package has the same name of the folder (e.g., chp-studyone contains the file chp-studyone.tex). This file starts with the usual chapter commands:

```tex
\chapter[Short chapter name]{Long chapter name}
\label{chp:shortlabelforchapter}
```

If the chapter is based on a paper you wrote, you should cite your own paper with the \blindfootnote{} command. For example:

```tex
\blindfootnote{This paper is based on Doe et al., 1999 \cite{DoeEtAl1999}.}
```

After that, you may put the content of your chapter, organized with the appropriate LaTeX commands: `\section`, `\subsection`, `\subsubsection`, etc. Don't forget to include a `\label{}` command with a short label if you want to cross-reference that section somewhere else in the document.

### How to include images or other graphical stuff

If you want to include an image, I strongly recommend doing the following:

1. Put the image into the images/ folder. For example, images/myimage.png

2. Create a file within the content/ folder (e.g., content/fig-myimage.tex) with commands to include and reference the image.  For example:
```tex
\begin{figure}\centering
\includegraphics[scale=0.8]{mychapter/images/myimage.png}
\caption[Short caption, to appear in the table of contents]{Long caption for the image, to appear beneath the image itself}
\label{LabelForTheImage}
\end{figure}
```

3. Include the previous file within the chapter:
```tex
\input{content/fig-myimage}
```

### How to make comments (actually, how to use editing commands)

I included a few commands to add editing capabilities to your thesis file. When you're editing your thesis, it's useful to have a mechanism to make comments, and introduce some stuff that may or may not end up in the thesis. Maybe your advisor wants to read the LaTeX file and make comments right there!

When writing and compiling your thesis, you can use two modes: *normal* and *draft*. The way to make it a draft is passing the option 'draft' to the documentclass command, like this:

```tex
\documentclass[11pt,draft]{cmuthesis}
```

To return to normal mode, simply take out the option 'draft'. All the following commands have different behavior depending on the mode you are:

`\comment{text}:`
- In draft mode: 'text' is displayed in red font, between square brackets, and preceded by the word 'Comment'.
- In normal mode: 'text' is not displayed.

`\edadd{text}: ('EDitor ADD')`
- In draft mode: 'text' is displayed in red font.
- In normal mode: 'text' is displayed in regular font.

`\eddelete{text}: ('EDitor DELETE')`
- In draft mode: 'text' is displayed in red font and crossed out.
- In normal mode: 'text' is not displayed

`\edreplace{text}{replacement}:`
- In draft mode: 'text' is displayed in red font and crossed out. 'replacement' is displayed in red font.
- In normal mode: only 'replacement' is displayed in regular font.


## For more information

### Official sources of information

You should always consult with the administrator of your department. As of January 2019, the official source of information for thesis guidelines at the College of Engineering in Carnegie Mellon University is https://engineering.cmu.edu/education/academic-policies/graduate-policies/thesis-dissertation.html

For EPP guidelines, go to: https://www.cmu.edu/epp/current/doctoral-thesis/index.html


### How do I get the latest version of this template?

1. Go to https://github.com/cristianbravolillo/EPP-CMU-Thesis/

2. Click on the button "Download ZIP", in the bottom of the column to the right.


### Dependencies

This template was compiled with pdfTeX 3.14159265-2.6-1.40.18. It was composed with TexStudio 2.6.2 in a laptop with Ubuntu 18.04 LTS. In theory, you may be able to use it in any TeX-capable distribution, although it has not been tested extensively in any other platform than Ubuntu 18.04.

In Ubuntu, you should install the following packages BEFORE trying to do anything:

```sh
% sudo apt install texlive textlive-latex-extra texlive-publishers
```

In other Linux distros, you should use the corresponding install command (e.g., yum, aptitude, etc.)

### License

The non-official EPP-CMU Thesis Template by Cristian Bravo-Lillo is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. To see a human-readable version of the license, please go to http://creativecommons.org/licenses/by-nc-sa/4.0/.

### Contact, bugs and acknowledgments

Cristian Bravo-Lillo, cristian AT ciberseguridadhumana DOT cl. Thanks to Nektarios Leontiadis for his input and help.

If you find a bug in the template (that is, something that is wrong based on the department or university guidelines), please leave me a note in GitHub:

1. Go to https://github.com/cristianbravolillo/EPP-CMU-Thesis/issues
1. Click on the button 'New issue' (green button to the right)
1. Give it a name and a longer description, and click on 'Submit new issue'.

If you want to thank me, you may send me a tweet to [@tamabravolillo](https://twitter.com/tamabravolillo) or leave a message at [LinkedIn](https://www.linkedin.com/in/cristianbravolillo/).
