\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gerot-assignment}
    [Basic Assignment Template]
\LoadClass[11pt]{exam} % uses exam class as the base and 11pt font

% load packages and libraries
\usepackage[x11names]{xcolor}
\usepackage[utf8]{inputenc}
\usepackage{
    pmboxdraw,epsfig,makecell,mathtools,hyperref,fullpage,tikz,fourier,
    wrapfig,etoolbox,enumitem,graphicx,multicol,listings,float,amssymb,amsthm, 
    amsmath,booktabs,fancybox,xparse,minted,changepage,xstring,fancyvrb
}
\usepackage[many]{tcolorbox}
\usepackage[algoruled]{algorithm2e}
\usepackage[margin=1cm]{geometry} % safe bet that printers can print this small of a margin
\usetikzlibrary{matrix,fit,backgrounds,trees,shapes}
% define colors for R input/output
\definecolor{back}{gray}{0.95}
\definecolor{frame}{gray}{0.90}
% sets the Tilde Operator ∼ [\u223C] (different from a Tilde ~ [\u007e]) to the shape of $\sim$
% which allows for use in code
\DeclareUnicodeCharacter{223C}{$\sim$}
% colors which may be commonly used
\definecolor{darkred}{rgb}{0.5,0,0}
\definecolor{darkgreen}{rgb}{0,0.5,0}
\pagestyle{empty} % remove page numbering
% sets numbering rules
\AtBeginEnvironment{align}{\setcounter{equation}{0}}
\renewcommand{\thesection}{}
\renewcommand{\thesubsection}{}
\newcounter{eni}
\setcounter{eni}{0}
\newcounter{enii}
\setcounter{enii}{0}
\newcounter{eniii}
\setcounter{eniii}{0}
% setting indents and depth of the table of contents
\setlength{\parindent}{0pt} %
\setlength{\parskip}{.25cm}
\setcounter{tocdepth}{5}
% set caligraphic math variables to their basic form
% otherwise they look way too fancy
\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}
% parameters for title
\renewcommand{\author}[1]{\gdef\ga@author{#1}}
\renewcommand{\title}[1]{\gdef\ga@title{#1}}
\newcommand{\course}[2]{\gdef\ga@cnum{#1}\gdef\ga@cname{#2}}
\renewcommand{\date}[1]{\gdef\ga@date{#1}}
% creates the header
\renewcommand{\maketitle}{
\begin{minipage}[t]{.34\textwidth}\ga@cnum\par\ga@cname\end{minipage}
\begin{minipage}[t]{.3\textwidth}\centering{\Large\ga@title}\par\ga@author\end{minipage}
\begin{minipage}[t]{.34\textwidth}\hspace*{0pt}\hfill{\ga@date}\end{minipage}
\par\vspace{1em}\hrule
}

% dynamic enclosing marks
\newcommand{\ps}[1]{\left(#1\right)} % parentheses
\newcommand{\bracks}[1]{\left[#1\right]} % square brackets
\newcommand{\braces}[1]{\left\{#1\right\}} % curly braces
\newcommand{\abs}[1]{\left|#1\right|} % absolute values
% Convenient Math Symbols
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\bhat}{\hat{\beta}}
\newcommand{\xhat}{\hat{x}}
\newcommand{\yhat}{\hat{y}}
\newcommand{\CE}{E\ps{Y|X=x}}
\newcommand{\E}{E\ps{X=x}}
\renewcommand{\ng}{\scalebox{0.5}[1.0]{$-$}}

% adds hanging indent to text -- especially useful in tabular environment
\newcommand{\hang}[1]
    {\begin{minipage}[t]{\linewidth}\hangindent=2em\hangafter=1\raggedright%
    #1\end{minipage}}

% answer environments
\newenvironment{answer}
    {\par\vspace*{-5pt}\par\begin{tcolorbox}
    [enhanced,breakable,center,sharp corners,
    borderline west={0.5pt}{0pt}{Snow3},
    colback=white,collower=gray,colframe=white,coltitle=black,
    boxed title style={sharp corners,colback=white},
    fontlower={\footnotesize},halign lower=flush right,valign lower=bottom,
    overlay first={\draw[line width=.5pt,Snow3](frame.north west)--++(0:3mm);},
    overlay last={\draw[line width=.5pt,Snow3](frame.south west)--++(0:3mm);},
    overlay unbroken=
        {\draw[line width=.5pt,Snow3](frame.north west)--++(0:3mm);
        \draw[line width=.5pt,Snow3](frame.south west)--++(0:3mm);}]}
    {\end{tcolorbox}}
\newenvironment{subanswer}
    {\begin{adjustwidth}{15pt}{0pt}\begin{answer}}
    {\end{answer}\end{adjustwidth}}
\newenvironment{subsubanswer}
    {\begin{adjustwidth}{30pt}{0pt}\begin{answer}}
    {\end{answer}\end{adjustwidth}}

% question environments
\newenvironment{question}
    {\begin{enumerate}[label=\arabic*.]\setcounter{enumi}{\value{eni}}\item}
    {\setcounter{eni}{\value{enumi}}\setcounter{enii}{0}\setcounter{eniii}{0}
    \end{enumerate}}
\newenvironment{subquestion}
    {\begin{adjustwidth}{30pt}{0pt}
    \begin{enumerate}[label=(\alph*)]\setcounter{enumi}{\value{enii}}\item}
    {\setcounter{enii}{\value{enumi}}
    \setcounter{eniii}{0}\end{enumerate}\end{adjustwidth}}
\newenvironment{subsubquestion}
    {\begin{adjustwidth}{50pt}{0pt}
    \begin{enumerate}[label=(\roman*)]\setcounter{enumi}{\value{eniii}}\item}
    {\setcounter{eniii}{\value{enumi}}\end{enumerate}\end{adjustwidth}}
\newcommand{\qtitle}[1]{\textbf{#1\hspace*{1em}}}

% display R code
\newenvironment{rcode}{
    \VerbatimEnvironment\begin{minted}[fontsize=\small,frame=leftline,framerule=2pt,rulecolor=lightgray!80,stripall,framesep=1em]{R}%
}{\end{minted}}
\lstnewenvironment{rout}{
	\lstset{language={}, basicstyle=\small\ttfamily, numbers=none, showstringspaces=false,literate={~}{$\sim$}1}
}{}
\renewcommand{\r}[1]{\mintinline{R}{#1}}

% R input & output boxes
\newcommand{\InOutRImg}[3][]
    {\IfStrEq{#1}{aside}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,sidebyside,
        colframe=frame,colback=back,colbacklower=white,
        left=7mm,sidebyside align=top seam,righthand width=.3\linewidth]\par
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}
    \tcblower\includegraphics[width=#3\linewidth]{imgs/#2.png}
    \end{tcolorbox}}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,
        colframe=frame,colback=back,colbacklower=white,
        halign lower=center,left=7mm,after=\vspace{1em}]\par
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}%
    \tcblower\par\includegraphics[width=#3\linewidth]{imgs/#2.png}%
    \end{tcolorbox}}}
\newcommand{\InOutR}[2][]
    {\IfStrEq{#1}{aside}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,sidebyside,
        colframe=frame,colback=back,colbacklower=white,
        left=7mm,sidebyside align=top,righthand width=.3\linewidth]\par
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}
    \tcblower\lstinputlisting[basicstyle=\small\tt]{out/#2.txt}
    \end{tcolorbox}}
    {\begin{tcolorbox}
        [enhanced,breakable,bicolor,sharp corners,colframe=frame,
        colback=back,colbacklower=white,halign lower=center,left=7mm]\par
    \inputminted[fontsize=\small,linenos]{R}{code/#2.R}
    \tcblower\lstinputlisting[basicstyle=\small\tt]{out/#2.txt}
    \end{tcolorbox}}}
