\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gerot-assignment}
    [Basic Assignment Template]
    
\LoadClass[11pt]{exam}

\printanswers
\usepackage[utf8]{inputenc}

\usepackage{pmboxdraw,epsfig,makecell,mathtools,xcolor,hyperref,fullpage,tikz,fourier,wrapfig,etoolbox,enumitem,graphicx,multicol,listings,float,amssymb,amsthm, amsmath,booktabs,fancybox,xparse,minted,changepage,xstring,fancyvrb}
\usepackage[many]{tcolorbox}
\usepackage[algoruled]{algorithm2e}
\usepackage[margin=40px]{geometry}
\DeclareUnicodeCharacter{223C}{$\sim$}

\definecolor{darkred}{rgb}{0.5,0,0}
\definecolor{darkgreen}{rgb}{0,0.5,0}
\usetikzlibrary{matrix,fit,backgrounds,trees,shapes}

\pagestyle{empty}
\AtBeginEnvironment{align}{\setcounter{equation}{0}}

\newenvironment{hangingindent}{
    \begin{minipage}[t]{\linewidth}
    \hangindent=2em
    \hangafter=1
    \raggedright%
}{
    \end{minipage}
}

\renewcommand{\author}[1]{\gdef\ga@author{#1}}
\renewcommand{\title}[1]{\gdef\ga@title{#1}}
\newcommand{\course}[1]{\gdef\ga@course{#1}}
\renewcommand{\date}[1]{\gdef\ga@date{#1}}

\renewcommand{\thesection}{}
\renewcommand{\thesubsection}{}
\newcounter{eni}
\setcounter{eni}{0}
\newcounter{enii}
\setcounter{enii}{0}
\newcounter{eniii}
\setcounter{eniii}{0}


\newcommand{\bb}[1]{\mathbb{#1}}
\newcommand{\parens}[1]{\left(#1\right)}
\newcommand{\bracks}[1]{\left[#1\right]}
\newcommand{\braces}[1]{\left\{#1\right\}}
\newcommand{\abs}[1]{\left|#1\right|}
\renewcommand{\maketitle}{
\begin{minipage}{0.33\textwidth}
    \large \ga@course
\end{minipage}
\begin{minipage}{0.33\textwidth}
    \centering
    \Large \ga@title
\end{minipage}
\begin{minipage}{0.325\textwidth}
    \hspace*{0pt}\hfill{\large \ga@date}
\end{minipage}
\vspace{-1.2em}
\begin{center}
    \ga@author
\end{center}
\vspace*{0.5em}
\hrule
}

\newcommand{\ps}[1]{\left(#1\right)}
\renewcommand{\bracks}[1]{\left[#1\right]}
\renewcommand{\braces}[1]{\left\{#1\right\}}
\renewcommand{\abs}[1]{\left|#1\right|}

% Math Symbols
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\F}{\mathcal{F}}
\renewcommand{\b}{\beta}
\newcommand{\bhat}{\hat{\beta}}
\newcommand{\xhat}{\hat{x}}
\newcommand{\yhat}{\hat{y}}
\newcommand{\CE}{E\ps{Y|X=x}}
\newcommand{\E}{E\ps{X=x}}


\setlength{\parindent}{0pt} %
\setlength{\parskip}{.25cm}
\setcounter{tocdepth}{5}

\newenvironment{answer}{

\vspace*{-5pt}

\begin{tcolorbox}[
    enhanced,breakable,center,sharp corners,
    borderline west={0.5pt}{0pt}{gray!50},
    colback=white,collower=black!90,
    colframe=white,coltitle=black,
    boxed title style={
        sharp corners,
        colback=white,
        colframe=gray
    },
    fontlower={\footnotesize},
    halign lower=flush right,
    valign lower=bottom,
    overlay first = {
        \draw[line width=0.5pt, gray!50] (frame.north west) -- ++(0:3mm);
    },
    overlay last = {
        \draw[line width=0.5pt, gray!50] (frame.south west) -- ++(0:3mm);
    },
    overlay unbroken = {
        \draw[line width=0.5pt, gray!50] (frame.north west) -- ++(0:3mm);
        \draw[line width=0.5pt, gray!50] (frame.south west) -- ++(0:3mm);
    }
]
}{
    \end{tcolorbox}
}

\newenvironment{question}{
    \begin{enumerate}[label=\arabic*.]
        \setcounter{enumi}{\value{eni}}
        \item}{
        \setcounter{eni}{\value{enumi}}
        \setcounter{enii}{0}
        \setcounter{eniii}{0}
    \end{enumerate}
}
\newenvironment{subquestion}{
    \begin{adjustwidth}{30pt}{0pt}
    \begin{enumerate}[label=(\alph*)]
        \setcounter{enumi}{\value{enii}}
        \item}{
        \setcounter{enii}{\value{enumi}}
        \setcounter{eniii}{0}
    \end{enumerate}
    \end{adjustwidth}
}
\newenvironment{subsubquestion}{
    \begin{adjustwidth}{50pt}{0pt}
     \begin{enumerate}[label=(\roman*)]
        \setcounter{enumi}{\value{eniii}}
        \item}{
        \setcounter{eniii}{\value{enumi}}
    \end{enumerate}
    \end{adjustwidth}
}
\newenvironment{rcode}{
    \VerbatimEnvironment\begin{minted}[fontsize=\small]{R}%
}{
    \end{minted}
}
\renewcommand{\r}[1]{\mintinline{R}{#1}}


\newcommand{\InOutRImg}[3][]{%
    \IfStrEq{#1}{aside}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,sidebyside,
        colframe=gray!10,colback=gray!5,colbacklower=white,
        left=7mm,sidebyside align=top seam,
        righthand width=.3\linewidth]\-\vspace{-1em}
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}
    \tcblower\includegraphics[width=#3\linewidth]{imgs/#2.png}
    \end{tcolorbox}}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,
        colframe=gray!10,colback=gray!5,colbacklower=white,
        halign lower=center,left=7mm]\-\vspace{-1.5em}
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}%
    \tcblower\-\vspace{-1em}\includegraphics[width=#3\linewidth]{imgs/#2.png}%
    \vspace{1em}
    \end{tcolorbox}}
}
\newcommand{\InOutR}[2][]{%
    \IfStrEq{#1}{aside}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,sidebyside,
        colframe=gray!10,colback=gray!5,colbacklower=white,
        left=7mm,sidebyside align=top,
        righthand width=.3\linewidth]
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}
    \tcblower\lstinputlisting[basicstyle=\small\tt]{out/#2.txt}
    \end{tcolorbox}}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,
        colframe=gray!10,colback=gray!5,colbacklower=white,
        halign lower=center,left=7mm]\-\vspace{-1.5em}
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}
    \tcblower\lstinputlisting[basicstyle=\small\tt]{out/#2.txt}
    \end{tcolorbox}}
}

\renewcommand{\ng}{\scalebox{0.5}[1.0]{$-$}}


\thispagestyle{empty}

\newenvironment{subanswer}{

\vspace*{-5pt}

\begin{adjustwidth}{15pt}{0pt}
\begin{tcolorbox}[
    enhanced,breakable,center,sharp corners,
    borderline west={0.5pt}{0pt}{gray!50},
    colback=white,collower=black!90,
    colframe=white,coltitle=black,
    boxed title style={
        sharp corners,
        colback=white,
        colframe=gray
    },
    fontlower={\footnotesize},
    halign lower=flush right,
    valign lower=bottom,
    overlay first = {
        \draw[line width=0.5pt, gray!50] (frame.north west) -- ++(0:3mm);
    },
    overlay last = {
        \draw[line width=0.5pt, gray!50] (frame.south west) -- ++(0:3mm);
    },
    overlay unbroken = {
        \draw[line width=0.5pt, gray!50] (frame.north west) -- ++(0:3mm);
        \draw[line width=0.5pt, gray!50] (frame.south west) -- ++(0:3mm);
    }
]
}{
    \end{tcolorbox}
    \end{adjustwidth}
}
\newenvironment{subsubanswer}{

\vspace*{-5pt}

\begin{adjustwidth}{30pt}{0pt}
\begin{tcolorbox}[
    enhanced,breakable,center,sharp corners,
    borderline west={0.5pt}{0pt}{gray!50},
    colback=white,collower=black!90,
    colframe=white,coltitle=black,
    boxed title style={
        sharp corners,
        colback=white,
        colframe=gray
    },
    fontlower={\footnotesize},
    halign lower=flush right,
    valign lower=bottom,
    overlay first = {
        \draw[line width=0.5pt, gray!50] (frame.north west) -- ++(0:3mm);
    },
    overlay last = {
        \draw[line width=0.5pt, gray!50] (frame.south west) -- ++(0:3mm);
    },
    overlay unbroken = {
        \draw[line width=0.5pt, gray!50] (frame.north west) -- ++(0:3mm);
        \draw[line width=0.5pt, gray!50] (frame.south west) -- ++(0:3mm);
    }
]
}{
    \end{tcolorbox}
    \end{adjustwidth}
}
