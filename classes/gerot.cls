\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gerot}[2022/11/06 Custom Template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% CLASS OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Option Macros
\gdef\g@hw{T}			% Assignment Style (F indicates non-assignment)
\gdef\g@index{F}		% Index toggle
\gdef\g@min{F}			% Minimal layout toggle
% Fonts
\gdef\g@font{sf1}		% Family (options: serifs sf1 - sf6, sans1, sans2)
\gdef\g@fontsize{11pt}	% Size (options: 10pt, 11pt, 12pt)
% Document geometry
\gdef\g@r{30pt}					% Right Margin
\gdef\g@l{30pt}					% Left Margin
\gdef\g@t{20pt}					% Top Margin
\gdef\g@b{20pt}					% Bottom Margin

%%% Options 
\DeclareOption{notes}{\gdef\g@hw{F}}			% layout for notes
\DeclareOption{fouriernc}{\gdef\g@font{sf1}}	% fouriernc font
\DeclareOption{lmodern}{\gdef\g@font{sf2}}		% lmodern font
\DeclareOption{newtx}{\gdef\g@font{sf3}}		% newtx font
\DeclareOption{charter}{\gdef\g@font{sf4}}		% bitstream charter font
\DeclareOption{gyre}{\gdef\g@font{sf5}}			% tex gyre scholar font with newtxmath
\DeclareOption{fourier}{\gdef\g@font{sf6}}		% fourier font
\DeclareOption{sans}{\gdef\g@font{sans1}}		% sans-serif font
\DeclareOption{lsans}{\gdef\g@font{sans2}}		% light sans-serif font
\DeclareOption{12pt}{\gdef\g@fontsize{12pt}}	% 12pt font size
\DeclareOption{11pt}{\gdef\g@fontsize{11pt}}	% 11pt font size
\DeclareOption{10pt}{\gdef\g@fontsize{10pt}}	% 10pt font size
\DeclareOption{index}{\gdef\g@index{T}}			% index generation
\DeclareOption{minimal}{\gdef\g@min{T}}			% minimal title

\DeclareOption{edits}{\gdef\g@r{2in}\gdef\g@l{.75in}}

\ProcessOptions\relax
\LoadClass[\g@fontsize]{article}	% Load base class

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[utf8]{inputenc}		% Encoding
\usepackage{xstring}			% If-else statments
%\usepackage{ifthen}
\usepackage{xparse}
\usepackage{etoolbox}
\usepackage[x11names]{xcolor}	% Colors
\usepackage{tikz}
\usepackage{pgfplots}

%%% Document Structure
\usepackage{geometry}
\usepackage{fullpage}
\usepackage{changepage}
\usepackage{graphicx}
\usepackage{float}
\usepackage{multicol}
\usepackage{parskip}	% Fixes parskip issues
\usepackage{fancyhdr}	% Custom head and foot

%%% Math
\usepackage{mathtools}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{xfrac}

%%% Misc
\usepackage{hyperref} 			% Links
\usepackage[many]{tcolorbox}
\usepackage{pmboxdraw}
\usepackage{fancybox}
\usepackage{booktabs} 			% Table formatting
\usepackage{titlesec}			% Section titling
\usepackage{enumitem}			% Numbering
\usepackage{xspace}				% Macro spacing
\usepackage{makeidx}			% Index generation
%\usepackage{marginnote}			% Make notes in margins

%%% Code
\usepackage{algorithm2e}	% Writing pseudocode
\usepackage{listings}		% Code formatting
\usepackage{fancyvrb}		% Verbatim formatting

%%% Fonts
\usepackage{bbm}
\usepackage{amsfonts}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MACROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Paragraphs
\gdef\g@parindent{0pt}			% Parindent
\gdef\g@parskip{3pt}			% Parskip

% Code boxes
\gdef\g@cdir{code}				% Directory for code files
\gdef\g@idir{imgs}				% Directory for image files
\gdef\g@odir{out}				% Directory for code output files

% Header macros
\gdef\g@head{T}			% Toggle to include header
\gdef\g@course{}		% Document course/class
\gdef\g@title{}			% Document title
\gdef\g@align{C}		% Alignment of header
\IfStrEq{\g@min}{F}		% Default and minimal content for header
	{\gdef\g@author{Katie Gerot}\gdef\g@date{\today}\gdef\g@headsep{30pt}}
	{\gdef\g@author{}\gdef\g@date{Updated \today}\gdef\g@headsep{10pt}}
% Spacing for maintaining alignment in header
\gdef\g@hsp{\IfStrEq\g@course{}{}{\IfStrEqCase\g@align{T{\\}B{}C{\\[-.5\baselineskip]}}}}

% Sections
\gdef\g@sttl{}\gdef\g@ssttl{}\gdef\g@sssttl{} % Section titles
\gdef\g@ssep{}\gdef\g@sssep{}\gdef\g@ssssep{} % Section separators
\gdef\g@sfmt{}\gdef\g@ssfmt{}\gdef\g@sssfmt{} % Section formats
\gdef\g@ssize{\Large}			% Font size of section title
\gdef\g@sssize{\large}		% Font size of subsection title
\gdef\g@ssssize{\normalsize}	% Font size of subsubsection title

% Question and answer boxes
\gdef\g@sskip{15pt}		% Inner skip for Sub Questions/Answer
\gdef\g@ssskip{30pt}	% Inner skip for Subsub Questions/Answer
\gdef\g@eni{\arabic*.}	% Numbering Style for Level 1 Questions
\gdef\g@enii{(\alph*)}	% Numbering Style for Level 2 Questions
\gdef\g@eniii{\roman*.}	% Numbering Style for Level 3 Questions
\gdef\g@alwns{1.5pt}	% Answer box border width (west)
\gdef\g@alww{1pt}		% Answer box border width (north-south)
\gdef\g@alen{5mm}		% Answer box border length
\gdef\g@agap{10pt} 		% Answer box border top/bottom gap

% Miscellaneous
\gdef\g@link{darkgray!40!blue}	% Link Color
\gdef\g@pgfc{newest}			% Version for pgfplots (pgfcompat)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% DOCUMENT COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\nohead}{\gdef\g@head{F}}		% Remove heading

\newcommand{\setparskip}[1]{\gdef\g@parskip{#1}\setlength\parskip\g@parskip}
\newcommand{\setparindent}[1]{\gdef\g@parindent{#1}}

%%%% FIX; runs very slowly %%%%
\newcommand{\margins}[4]{\gdef\g@t{#1}\gdef\g@r{#2}\gdef\g@b{#3}\gdef\g@l{#4}
	\geometry{top=\g@t,right=\g@r,bottom=\g@b,left=\g@l}}	% Set All Margins
\newcommand{\tmargin}[1]{\margins{#1}{\g@r}{\g@b}{\g@l}}	% Top Document Margin
\newcommand{\rmargin}[1]{\margins{\g@t}{#1}{\g@b}{\g@l}}	% Right Document Margin
\newcommand{\bmargin}[1]{\margins{\g@t}{\g@r}{#1}{\g@l}}	% Bottom Document Margin
\newcommand{\lmargin}[1]{\margins{\g@t}{\g@r}{\g@b}{#1}}	% Left Document Margin
\newcommand{\vmargin}[1]{\margins{#1}{\g@r}{#1}{\g@l}}		% Vertical Margins (TB)
\newcommand{\hmargin}[1]{\margins{\g@t}{#1}{\g@b}{#1}}		% Horizontal Margins (RL)
\newcommand{\vhmargin}[2]{\margins{#1}{#2}{#1}{#2}}			% TB and RL Grouped Margins
\newcommand{\globalmargin}[1]{\margins{#1}{#1}{#1}{#1}}		% Set All Margins the Same

\renewcommand{\author}[1]{\gdef\g@author{#1}}			% Document Author
\renewcommand{\title}[1]{\gdef\g@title{{\Large #1}}}	% Document Title
\renewcommand{\date}[1]{\gdef\g@date{#1}}				% Document Date
\newcommand{\course}[1]{\gdef\g@course{\\ #1}}			% Document Course

\newcommand{\qlabel}[1]{\gdef\g@eni{#1}}		% Question label
\newcommand{\sqlabel}[1]{\gdef\g@enii{#1}}		% Subquestion label
\newcommand{\ssqlabel}[1]{\gdef\g@eniii{#1}}	% Subsubquestion label

\newcommand{\sectitle}[1]{\gdef\g@sttl{#1\space}}		% Section titles
\newcommand{\subsectitle}[1]{\gdef\g@ssttl{#1}}			% Subsection titles
\newcommand{\subsubsectitle}[1]{\gdef\g@sssttl{#1}}		% Subsubsection titles
\newcommand{\secseperator}[1]{\gdef\g@ssep{#1}}			% Section seperators
\newcommand{\subsecseperator}[1]{\gdef\g@sssep{#1}}		% Subsection seperators
\newcommand{\subsubsecseperator}[1]{\gdef\g@ssssep{#1}}	% Subsubsection seperators
\newcommand{\secsize}[1]{\gdef\g@ssize{#1}}				% Section title size
\newcommand{\subsecsize}[1]{\gdef\g@sssize{#1}}			% Subsection title size
\newcommand{\subsubsecsize}[1]{\gdef\g@ssssize{#1}}		% Subsubsection title size

\newcommand{\codedirectory}[1]{\gdef\g@cdir{#1}}	% Code Directory
\newcommand{\imgdirectory}[1]{\gdef\g@idir{#1}}		% Image Directory
\newcommand{\outdirectory}[1]{\gdef\g@odir{#1}}		% Output Directory

\newcommand{\proofs}{\newpage\appendix\section{Reference}}

%\newcommand{\sidenote}[2][\@notecol]{\marginnote{\small\raggedright\color{#1}#2} }
\newcommand{\intextnote}[2][green]{{\small\raggedright\color{#1}#2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% FONT SELECTION %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Font Packages
\gdef\g@fc{00000021100}
\IfStrEqCase{\g@font}{{sf1}{\gdef\g@fc{00000058800}\usepackage{fouriernc}}
	{sf2}{\gdef\g@fc{00000079923}\usepackage{lmodern}}
	{sf3}{\gdef\g@fc{00000029032}\usepackage{newtx}}
	{sf4}{\gdef\g@fc{11111121100}\usepackage[bitstream-charter]{mathdesign}\let\mathcal\undefined}
	{sf5}{\gdef\g@fc{00000030020}\usepackage{tgschola}\usepackage[scaled=1.1]{newtxmath}}
	{sf6}{\gdef\g@fc{00000020000}\usepackage{fourier}}
	{sans1}{\gdef\g@fc{33333113321}\usepackage[sfdefault,scaled=.85]{FiraSans}\usepackage{newtxsf}}
	{sans2}{\gdef\g@fc{44455643702}\usepackage{cmbright}}}
\usepackage{inconsolata} % monospace font

% separate out the ams blackboard bold font family
\def\amsbb{\use@mathgroup\M@U\symAMSb}
% define bbold to not overwrite \mathbb
\newcommand{\bbfamily}{\fontencoding{U}\fontfamily{bbold}\selectfont}
\DeclareMathAlphabet{\bbold}{U}{bbold}{m}{n}

% Correct calligraphic font when necessary
\newif\ifcal\IfStrEqCase{\g@font}{{sf1}{\caltrue}{sf4}{\caltrue}{sf6}{\caltrue}}[\calfalse]
\ifcal\DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}\else\fi

% math bold defined for all fonts
\newcommand{\mbb}[2][1]{\StrChar{\g@fc}{#1}[\testvar]\IfStrEqCase{\testvar}{{0}{\amsbb{#2}}{1}{\mathbb{#2}}{2}{\mathbbm{#1}}{3}{\mathbbmss{#2}}
		{4}{\text{\scalebox{1.05}[1]{$\bbold{#2}$}}}{5}{\text{\scalebox{1.2}[1]{$\bbold{#2}$}}}
		{6}{\mathbf{#2}}{7}{\bbold{#2}}{8}{\text{\scalebox{0.85}[1]{$\boldsymbol{\mathbbm{#2}}$}}}
		{9}{\text{\scalebox{0.9}[1]{$\mathbbm{#2}$}}}{a}{\text{\scalebox{0.9}[0.95]{$\mathbbm{#2}$}}}}}
% spacing for E and Prob by font
\newcommand{\fspace}[1]{\StrChar{\g@fc}{#1}[\testvar]\IfStrEqCase{\testvar}{{0}{}{1}{\!}{2}{\negmedspace\,}{3}{\negthickspace\,}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% REMAINING SETUP %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tikz libraries
\usetikzlibrary{matrix,fit,backgrounds,trees,shapes,intersections,patterns}

\pgfplotsset{compat=\g@pgfc} 					% set pgfplots version
\IfStrEq\g@index{T}{\makeindex}{}				% setup index

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% INTERNAL COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\idx}[1]{\textsl{#1}\index{#1}}
\newcommand{\subidx}[2]{\textsl{#1}\index{#2!#1}}
\newcommand{\atidx}[2]{\textsl{#1}\index{#2@#1}}
\newcommand{\resethead}[1][0pt]{\fancyhead{}\fancyfoot{}\renewcommand{\headrulewidth}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% PAGE LAYOUT AND GEOMETRY %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Margins and Geometry
\setlength\parindent\g@parindent\setlength\parskip\g@parskip\setcounter{tocdepth}{3}
\geometry{right=\g@r,top=\g@t,bottom=\g@b,left=\g@l,headsep=\g@headsep,includeheadfoot}

% Header and Footer
\fancypagestyle{first}{
	\IfStrEq{\g@head}{T}{\resethead\setlength\headheight{20pt}
		\IfStrEq{\g@min}{T} % check if title style is minimal
			{\fancyhead[C]{\g@title\\\g@date}} % if minimal, just title and date
			{\fancyhead[L]{\g@author\g@hsp}
			\fancyhead[C]{\g@title\g@course}
			\fancyhead[R]{\g@date\g@hsp}}
	}{\resethead}
}
% non-title page style (just page number if style is notes)
\fancypagestyle{main}{\resethead}
% set default page as "main" and title page as "first"
\pagestyle{main}\thispagestyle{first}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% COUNTER SETUP AND CUSTOM COUNTERS %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Custom Counters for Question Numbering
\newcounter{eni}\newcommand\reseti{\setcounter{eni}{0}}
\newcounter{enii}\newcommand\resetii{\setcounter{enii}{0}}
\newcounter{eniii}\newcommand\resetiii{\setcounter{eniii}{0}}
\reseti\resetii\resetiii	% set counters to 0

% Section Numbering Custom Counter
\newcounter{secs}\setcounter{secs}{0}
\newcommand{\addsec}{\addtocounter{secs}{1}}

% Equation Numbering
\newcounter{anseq}\setcounter{anseq}{0}
\newcounter{subanseq}\setcounter{subanseq}{0}
\newcounter{preveq}\setcounter{preveq}{0}
\newcounter{questionnum}\setcounter{questionnum}{0}
\newcounter{subquestionnum}\setcounter{subquestionnum}{0}
\newcounter{subsubquestionnum}\setcounter{subsubquestionnum}{0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% CUSTOM COMMANDS AND DECLARATIONS %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Common Unicode Symbols
\DeclareUnicodeCharacter{223C}{\ensuremath{\sim}}
\DeclareUnicodeCharacter{00B1}{\ensuremath{\pm}}
\DeclareUnicodeCharacter{03A9}{\ensuremath{\Omega}}
\DeclareUnicodeCharacter{222A}{\ensuremath{\cup}}
\DeclareUnicodeCharacter{2229}{\ensuremath{\cap}}
\DeclareUnicodeCharacter{03BC}{\ensuremath{\mu}}
\DeclareUnicodeCharacter{2286}{\ensuremath{\subseteq}}
\DeclareUnicodeCharacter{2208}{\ensuremath{\in}}
\DeclareUnicodeCharacter{03B4}{\ensuremath{\delta}}
\DeclareUnicodeCharacter{03BB}{\ensuremath{\lambda}}
\DeclareUnicodeCharacter{03F5}{\ensuremath{\epsilon}}

% Colors
\definecolor{cFrm}{rgb}{0.96, 0.96, 0.96}	% color of tcolorbox frame
\definecolor{cStr}{rgb}{0.00, 0.40, 0.15}	% color of code strings
\definecolor{cCmt}{rgb}{0.35, 0.60, 0.30}	% color of code comments
\definecolor{cKey}{rgb}{0.00, 0.00, 1.00}	% color of code keywords
\definecolor{cErr}{rgb}{0.77, 0.02, 0.04}	% color of error messages

% Set up link colors
\hypersetup{colorlinks=true,linkcolor=\g@link,urlcolor=\g@link}

% Section title formats
\newcommand{\formatsections}{%
	\titleformat{\section}[hang]{\normalfont\g@ssize\bfseries}
		{\g@sttl\thesection\g@ssep}{10pt}{\gdef\g@sttl{}}
	\titleformat{\subsection}[hang]{\normalfont\g@sssize\bfseries}
		{\g@ssttl\thesubsection\g@sssep}{10pt}{\gdef\g@ssttl{}}
}
\formatsections
	
% Hanging indent
\newcommand{\hang}[1]{\begin{minipage}[t]{\linewidth}
		\hangindent=2em\hangafter=1\raggedright{#1}\end{minipage}}
% Highlight Text
\newcommand{\hl}[2][yellow]{\colorbox{#1!20}{#2\strut}}
\newcommand{\unfinished}
	{{}\par\textsf{\hl{\scriptsize\hspace{.4\linewidth}TODO\hspace{.4\linewidth}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% LISTINGS ENVIRONMENTS %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\lstdefinestyle{rstyle}{language=R,
	keywords={library,attach,detach,function,return,for,while,T,F,TRUE,FALSE},
	commentstyle=\color{cCmt},keywordstyle=\color{cKey},stringstyle=\color{cStr},
	numberstyle=\ttfamily\scriptsize\color{gray},basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,breaklines=true,keepspaces=true,
	showstringspaces=false,numbers=left,
	literate={+}{{{+}}}{1}{-}{{{-}}}{1}{*}{{{*}}}{1}{/}{{{/}}}{1}{=}{{{=}}}{1}
	{<}{{{<}}}{1}{>}{{{>}}}{1}{_}{{{\_}}}{1}{~}{{$\sim$}}{1}}
\lstdefinestyle{cstyle}{language=C,
	commentstyle=\color{cCmt},keywordstyle=\color{cKey},stringstyle=\color{cStr},
	numberstyle=\ttfamily\scriptsize\color{gray},basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,breaklines=true,keepspaces=true,
	showstringspaces=false,numbers=left}
\lstdefinestyle{pystyle}{language=Python,
	commentstyle=\color{cCmt},keywordstyle=\color{cKey},stringstyle=\color{cStr},
	numberstyle=\ttfamily\scriptsize\color{gray},basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,breaklines=true,keepspaces=true,
	showstringspaces=false,numbers=left}
\lstdefinestyle{mlstyle}{language=Matlab,
	commentstyle=\color{cCmt},keywordstyle=\color{cKey},stringstyle=\color{cStr},
	numberstyle=\ttfamily\scriptsize\color{gray},basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,breaklines=true,keepspaces=true,
	showstringspaces=false,numbers=left}
\lstdefinestyle{txt}{language={},basicstyle=\ttfamily\footnotesize,literate={~}{$\sim$}{1},
	moredelim=**[is][\color{cErr}]{@}{@}}
\lstnewenvironment{comment*}{\lstset{basicstyle=\ttfamily,
	breaklines=true,captionpos=b,frame=bottomline,extendedchars=true}}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% TCOLORBOX ENVIRONMENTS %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtcolorbox{abx}[3]{enhanced,breakable,center,sharp corners,
	left skip=#3,colback=#1,colframe=white,coltitle=black,right=-3pt,
	borderline west={\g@alww}{0pt}{#2},parbox=false,top=\g@agap,bottom=\g@agap,
	overlay first={\draw[line width=\g@alwns,#2](frame.north west)--++(0:\g@alen);},
	overlay last={\draw[line width=\g@alwns,#2](frame.south west)--++(0:\g@alen);},
	overlay unbroken={\draw[line width=\g@alwns,#2](frame.north west)--++(0:\g@alen);
		\draw[line width=\g@alwns,#2](frame.south west)--++(0:\g@alen);}}
\newtcolorbox{qbx}[1][0pt]{enhanced,breakable,center,sharp corners,frame hidden,
	parbox=false,left skip=#1,colback=white,boxsep=0pt,left=0pt,right=0pt,top=0pt,bottom=0pt}
\newtcolorbox{quotebox}{enhanced,breakable,center,sharp corners,
	colback=white,colframe=white,top=5pt,bottom=5pt,left=5pt}
\newtcolorbox{ras}[1]{enhanced,breakable,bicolor,sharp corners,sidebyside,
	colframe=white,colback=cFrm,colbacklower=white,top=-2pt,bottom=-4pt,
	left=7mm,sidebyside align=top seam,righthand width=#1\linewidth}
\newtcolorbox{rbx}[1]{enhanced,breakable,bicolor,sharp corners,
	frame hidden,colback=cFrm,colbacklower=white,top=-2pt,bottom=-4pt,middle=0pt,
	halign lower=center,left=2mm,right=2mm,after=\vspace{0em}}
\newtcolorbox{nbx}[1][gray!6]{enhanced,breakable,center,sharp corners,
	colback=#1,colframe=#1,coltitle=black,boxrule=1pt}

% Question Formats
\newenvironment{qbs}[3]%
	{\begin{qbx}[#1]\begin{enumerate}[label=#2]\setcounter{enumi}{\value{#3}}\item}
	{\end{enumerate}\end{qbx}}
\newenvironment{question}{\begin{qbs}{0pt}{\g@eni}{eni}}
	{\end{qbs}\setcounter{eni}{\value{enumi}}\resetii\resetiii}
\newenvironment{subquestion}{\begin{qbs}{\g@sskip}{\g@enii}{enii}}
	{\end{qbs}\setcounter{enii}{\value{enumi}}\resetiii}
\newenvironment{subsubquestion}{\begin{qbs}{\g@ssskip}{\g@eniii}{eniii}}
	{\end{qbs}\setcounter{eniii}{\value{enumi}}}

% Answer Formats
\newenvironment{anbs}[2]{\begingroup\def\g@base{cFrm}\def\g@back{cFrm!25}
	\IfStrEq{#1}{finished}{\def\g@base{cFrm}\def\g@back{white}}{}
	\IfStrEq{#1}{unfinished}{\def\g@base{orange!30}\def\g@back{orange!5}}{}
	\begin{abx}\g@back\g@base{#2}}{\end{abx}\endgroup}
\newenvironment{answer}[1][finished]{\begin{anbs}{#1}{0pt}}{\end{anbs}}
\newenvironment{subanswer}[1][finished]{\begin{anbs}{#1}\g@sskip}{\end{anbs}}
\newenvironment{subsubanswer}[1][finished]{\begin{anbs}{#1}\g@ssskip}{\end{anbs}}

% Quoting Environments
\newcommand{\qtitle}[1]{\textbf{#1}\hspace*{15pt}}
\AtBeginEnvironment{quote}{\raggedright}
\newenvironment{reference}{\begingroup\begin{quote}\begin{quotebox}%
	\small\setlength{\parskip}{0cm}\setlength{\parindent}{15pt}\noindent\color{black}}
	{\end{quotebox}\end{quote}\endgroup}

% General Code Environments
\newcommand{\ICode}[3]{\begin{rbx}\par\lstinputlisting[style=#2]{\g@cdir/#1.#3}\end{rbx}}
\newcommand{\InR}[1]{\ICode{#1}{rstyle}{R}} % legacy
\newcommand{\IR}[1]{\ICode{#1}{rstyle}{R}}
\newcommand{\IC}[1]{\ICode{#1}{cstyle}{c}}
\newcommand{\IPy}[1]{\ICode{#1}{pystyle}{py}}
\newcommand{\IMatlab}[1]{\ICode{#1}{mlstyle}{m}}
\newcommand{\IText}[1]{\ICode{#1}{txt}{txt}}

\newcommand{\InlineCode}[2]{\colorbox{cFrm}{\lstinline[style=#2,columns=fixed]{#1}}}
\newcommand{\InlineR}[1]{\InlineCode{#1}{rstyle}}
\newcommand{\InlineC}[1]{\InlineCode{#1}{cstyle}}
\newcommand{\InlinePy}[1]{\InlineCode{#1}{pystyle}}
\newcommand{\InlineMatlab}[1]{\InlineCode{#1}{mlstyle}}
\newcommand{\InlineText}[1]{\InlineCode{#1}{txt}}

\newcommand{\IOCode}[4][]{\IfStrEq{#1}{aside}
	{\begin{ras}{0.33}\par\lstinputlisting[style=#3]{\g@cdir/#2.#4}\tcblower
		\lstinputlisting[style=txt]{\g@odir/#2.txt}\end{ras}}
	{\begin{rbx}\par\lstinputlisting[style=#3]{\g@cdir/#2.#4}\tcblower\vspace*{5pt}
		\lstinputlisting[style=txt]{\g@odir/#2.txt}\end{rbx}\vspace*{5pt}}}
\newcommand{\InOutR}[2][]{\IOCode[#1]{#2}{rstyle}{R}} % legacy
\newcommand{\IOR}[2][]{\IOCode[#1]{#2}{rstyle}{R}}
\newcommand{\IOC}[2][]{\IOCode[#1]{#2}{cstyle}{c}}
\newcommand{\IOPy}[2][]{\IOCode[#1]{#2}{pystyle}{py}}
\newcommand{\IOMatlab}[2][]{\OICode[#1]{#2}{mlstyle}{m}}

\newcommand{\IOCodeImg}[5][]{\IfStrEq{#1}{aside}
	{\begin{ras}{#3}\par\lstinputlisting[style=#4]{\g@cdir/#2.#5}\tcblower
		\includegraphics[width=\linewidth]{imgs/#2.pdf}\end{ras}}
	{\begin{rbx}\par\lstinputlisting[style=#4]{\g@cdir/#2.#5}\tcblower\vspace*{10pt}\par
		\includegraphics[width=#3\linewidth]{\g@idir/#2.pdf}\end{rbx}}}
\newcommand{\InOutRImg}[3][]{\IOCodeImg[#1]{#2}{#3}{rstyle}{R}} % legacy
\newcommand{\IORImg}[3][]{\IOCodeImg[#1]{#2}{#3}{rstyle}{R}}
\newcommand{\IOCImg}[3][]{\IOCodeImg[#1]{#2}{#3}{cstyle}{c}}
\newcommand{\IOPyImg}[3][]{\IOCodeImg[#1]{#2}{#3}{pystyle}{py}}
\newcommand{\IOMatlabImg}[3][]{\IOCodeImg[#1]{#2}{#3}{mlstyle}{m}}

\newcommand{\IOCodeLines}[6][]{\IfStrEq{#1}{aside}{\begin{ras}{0.5}\par
		\lstinputlisting[style=#3,firstline=#5,lastline=#6]{\g@cdir/#2.#4}
		\tcblower\lstinputlisting[style=txt]{\g@odir/#2.txt}\end{ras}}
	{\begin{rbx}\par
		\lstinputlisting[style=#3,firstline=#5,lastline=#6]{\g@cdir/#2.#4}
		\tcblower\vspace*{5pt}\lstinputlisting[style=txt]{\g@odir/#2.txt}
	\end{rbx}\vspace*{5pt}}}
\newcommand{\InOutRLines}[4][]{\IOCodeLines[#1]{#2}{rstyle}{R}{#3}{#4}} % legacy
\newcommand{\IORLines}[4][]{\IOCodeLines[#1]{#2}{rstyle}{R}{#3}{#4}}
\newcommand{\IOCLines}[4][]{\IOCodeLines[#1]{#2}{cstyle}{c}{#3}{#4}}
\newcommand{\IOPyLines}[4][]{\IOCodeLines[#1]{#2}{pystyle}{py}{#3}{#4}}
\newcommand{\IOMatlabLines}[4][]{\IOCodeLines[#1]{#2}{mlstyle}{m}{#3}{#4}}

\newcommand{\IOCodeImgLines}[7][]{\IfStrEq{#1}{aside}{\begin{ras}{#3}\par
		\lstinputlisting[style=#4,firstline=#6,lastline=#7]{\g@cdir/#2.#5}\tcblower
		\includegraphics[width=\linewidth]{imgs/#2.pdf}\end{ras}}
	{\begin{rbx}\par
		\lstinputlisting[style=#4,firstline=#6,lastline=#7]{\g@cdir/#2.#5}
		\tcblower\vspace*{-2pt}\par\includegraphics[width=#3\linewidth]{\g@idir/#2.pdf}
	\end{rbx}}}
\newcommand{\InOutRImgLines}[5][]{\IOCodeImgLines[#1]{#2}{#3}{rstyle}{R}{#4}{#5}} % legacy
\newcommand{\IORImgLines}[5][]{\IOCodeImgLines[#1]{#2}{#3}{rstyle}{R}{#4}{#5}}
\newcommand{\IOCImgLines}[5][]{\IOCodeImgLines[#1]{#2}{#3}{cstyle}{c}{#4}{#5}}
\newcommand{\IOPyImgLines}[5][]{\IOCodeImgLines[#1]{#2}{#3}{pystyle}{py}{#4}{#5}}
\newcommand{\IOMatlabImgLines}[5][]{\IOCodeImgLines[#1]{#2}{#3}{mlstyle}{m}{#4}{#5}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% CUSTOM MATH COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Enclosures
\newcommand{\ps}[1]{\left(#1\right)} 			% parentheses
\newcommand{\psb}[1]{\bigl(#1\bigr)} 			% parentheses big
\newcommand{\psB}[1]{\Bigl(#1\Bigr)} 			% parentheses Big
\newcommand{\psbg}[1]{\biggl(#1\biggr)} 		% parentheses bigg
\newcommand{\psBg}[1]{\Biggl(#1\Biggr)} 		% parentheses Bigg
\newcommand{\bracks}[1]{\left[#1\right]}		% square brackets
\newcommand{\bracksb}[1]{\bigl[#1\bigr]}		% square brackets big
\newcommand{\bracksB}[1]{\Bigl[#1\Bigr]}		% square brackets Big
\newcommand{\bracksbg}[1]{\biggl[#1\biggr]}		% square brackets bigg
\newcommand{\bracksBg}[1]{\Biggl[#1\Biggr]}		% square brackets Bigg
\newcommand{\braces}[1]{\left\{#1\right\}} 		% curly braces
\newcommand{\bracesb}[1]{\bigl\{#1\bigr\}} 		% curly braces big
\newcommand{\bracesB}[1]{\Bigl\{#1\Bigr\}} 		% curly braces Big
\newcommand{\bracesbg}[1]{\biggl\{#1\biggr\}} 	% curly braces bigg
\newcommand{\bracesBg}[1]{\Biggl\{#1\Biggr\}}	% curly braces Bigg
\newcommand{\set}[1]{\left\{\:#1\:\right\}} 		% curly braces (set)
\newcommand{\abs}[1]{\left|#1\right|} 			% absolute values
\newcommand{\norm}[1]{\left\lVert{#1}\right\rVert}

% Fields, Measures, and Algebras
\newcommand{\mc}[1]{\mathcal{#1}}	% mathcal redef
\newcommand{\R}{\mbb[1]{R}}
\newcommand{\Z}{\mbb[2]{Z}}
\newcommand{\C}{\mbb[3]{C}}
\newcommand{\Q}{\mbb[4]{Q}}
\newcommand{\N}{\mbb[5]{N}}
\newcommand{\bS}{\mbb[6]{S}}
\newcommand{\Ind}{\mbb[7]{1}}
\newcommand{\E}{\mbb[8]{E}\fspace{10}}
\newcommand{\Prob}{\mbb[9]{P}\fspace{11}}
\newcommand{\bEs}[2]{\E_{#1}\!\bracks{#2}}
\newcommand{\bE}[1]{\E\bracks{#1}}
\newcommand{\F}{\ensuremath{\mathcal{F}}\xspace}
\newcommand{\cC}{\ensuremath{\mathcal{C}}\xspace}
\newcommand{\A}{\ensuremath{\mathcal{A}}\xspace}
\newcommand{\T}{\ensuremath{\mathcal{T}}\xspace}
\newcommand{\sS}{\ensuremath{\mathcal{S}}\xspace}
\newcommand{\gG}{\ensuremath{\mathcal{G}}\xspace}
\newcommand{\hH}{\ensuremath{\mathcal{H}}\xspace}
\newcommand{\Borel}{\ensuremath{\mathcal{B}}\xspace}
\newcommand{\nN}{\ensuremath{\mathcal{N}}\xspace}
\renewcommand{\mod}[1]{\;(\mathrm{mod}\; #1)}
% Variables
\newcommand{\vbeta}{\ensuremath{\boldsymbol{\beta}}\xspace}
\newcommand{\vpsi}{\ensuremath{\boldsymbol{\psi}}}
\newcommand{\vtheta}{\ensuremath{\boldsymbol{\theta}}\xspace}
\newcommand{\bhat}{\hat{\beta}\xspace}
\newcommand{\xhat}{\hat{x}\xspace}
\newcommand{\yhat}{\hat{y}\xspace}
\newcommand{\varalpha}{\text{\scalebox{1.15}[1.0]{$\alpha$}}\xspace}
% Functions
\newcommand{\Cov}{\mathrm{Cov}}
\newcommand{\Ex}[1]{\mathrm{E}\bracks{#1}}
%\newcommand{\bE}[1]{\E\bracks{#1}\xspace}
\newcommand{\Var}[1][X]{\mathrm{Var}\ps{#1}}
\newcommand{\func}[3][f]{\ensuremath{#1 \::\: #2\to #3}\xspace}
\newcommand{\frr}[1][f]{\func[#1]{\R}{\R}\xspace}
\newcommand{\frb}[1][f]{\func[#1]{(\R, \Borel_\R)}{(\R, \Borel_\R)}\xspace}
\newcommand{\msp}[1][\mu]{\ensuremath{(\Omega, \F, #1)}\xspace}
\newcommand{\avgdef}[1][X]{\ensuremath{\frac{1}{n}\sum_{i=1}^n {#1}_i}}
\newcommand{\stdsum}{\ensuremath{\frac{1}{n}\sum_{i=1}^{n}}}
\newcommand{\cas}{\ensuremath{\;\;\textit{ a.s.}}}
% Misc Symbols
\newcommand{\argmin}[1]{\underset{#1}{\arg\;\min}\;}
\newcommand{\dd}[1]{\;\mathrm{d}{#1}}
\newcommand{\eval}[2]{\Big|_{#1}^{#2}}
\renewcommand{\ng}{\scalebox{0.5}[1.0]{$-$}}
%\newcommand{\Ind}{\ensuremath{\mathbb{1}}}
\newcommand{\stdU}{\ensuremath{\mathrm{Unif}\,(0,1)}}
\newcommand{\sdfrac}[2]{\ensuremath{\displaystyle\sfrac{#1}{#2}}}
\newcommand{\mint}{\;\rotatebox[origin=c]{90}{$\vert$}\;}
\newcommand{\pp}{\ensuremath{\!\!+\!\!+}}
\newcommand{\cqed}{\ensuremath{\quad\checkmark}}
\newcommand{\sqed}{\ensuremath{\parallelslant}}
\newcommand{\tqed}{\hspace*{\fill}$\qed$}
% Convergence and Sequences
\newcommand{\conp}{\ensuremath{\overset{p}{\to}}\xspace}
\newcommand{\cond}{\ensuremath{\overset{d}{\to}}\xspace}
\newcommand{\conas}{\ensuremath{\overset{a.s.}{\to}}\xspace}
\newcommand{\conL}[1]{\ensuremath{\overset{L^{#1}}{\to}}\xspace}
\newcommand{\seq}[2]{\ensuremath{\ps{#1}_{n=#2}^{\infty}}}
% Custom Symbol Support
\newcommand{\custsymb}[1]{\includegraphics[width=1em]{#1}}
% Math Notes
\newcommand{\upnote}[2]
{\overset{\mathclap{\textstyle #1}}{\overset{\uparrow}{\overset{}{#2}}}}
\newcommand{\downnote}[2]
{\underset{\mathclap{\textstyle #1}}{\underset{\downarrow}{\underset{}{#2}}}}

%%%%% THEOREMS %%%%%
\theoremstyle{definition}
\newtheorem{inthm}{}\newenvironment{thm}[1]
	{\renewcommand\theinthm{#1}\inthm}{\endinthm}
\theoremstyle{remark}
\newtheorem*{remark}{Remark}
\theoremstyle{definition}
\newtheorem{example}{Example}[section]
\newtheorem{exercise}{Exercise}[section]
\newtheorem{definition}{Definition}[section]
\newtheorem{proposition}{Proposition}[section]
\newtheorem{lemma}{Lemma}[section]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% FINAL ENVIRONMENT SETUPS %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginEnvironment{question}{\setcounter{subquestionnum}{0}\setcounter{subsubquestionnum}{0}
	\setcounter{equation}{0}\addtocounter{questionnum}{1}}
\AtBeginEnvironment{subquestion}{\setcounter{equation}{0}
	\addtocounter{subquestionnum}{1}\setcounter{subsubquestionnum}{0}
	\renewcommand{\theequation}{\arabic{questionnum}\alph{subquestionnum}.\arabic{equation}}}
\AtBeginEnvironment{subsubquestion}{\setcounter{equation}{0}\addtocounter{subsubquestionnum}{1}
	\renewcommand{\theequation}{\alph{subquestionnum}(\roman{subsubquestionnum}).\arabic{equation}}}

\AtBeginEnvironment{answer}%
	{\setcounter{equation}{0}\renewcommand{\theequation}{\arabic{questionnum}.\arabic{equation}}}
\AtBeginEnvironment{subanswer}{\setcounter{equation}{0}
	\renewcommand{\theequation}{\arabic{questionnum}\alph{subquestionnum}.\arabic{equation}}}
\AtBeginEnvironment{subsubanswer}{\setcounter{equation}{0}
	\renewcommand{\theequation}{\arabic{questionnum}%
		\alph{subquestionnum}(\roman{subsubquestionnum}).\arabic{equation}}}