\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dnd}[2024/03/28 Custom Template]


\LoadClass[10pt]{article}	% Load base class

\usepackage{geometry}
\usepackage[many]{tcolorbox}

\usepackage[sfdefault,scaled=.85]{FiraSans}

\geometry{margin=0in, headsep=0pt, papersize={8.5in, 11in}, top=0.25in}

\setlength\parskip{0pt}

\newtcolorbox{basicbox}{enhanced,breakable,center,sharp corners,colback=white,colframe=black,boxrule=1pt}

\gdef\dnd@str{8}
\gdef\dnd@dex{8}
\gdef\dnd@con{8}
\gdef\dnd@int{8}
\gdef\dnd@wis{8}
\gdef\dnd@cha{8}

\newcommand{\setstrength}[1]{\gdef\dnd@str{#1}}
\newcommand{\setdexterity}[1]{\gdef\dnd@dex{#1}}
\newcommand{\setconstitution}[1]{\gdef\dnd@con{#1}}
\newcommand{\setintelligence}[1]{\gdef\dnd@int{#1}}
\newcommand{\setwisdom}[1]{\gdef\dnd@wis{#1}}
\newcommand{\setcharisma}[1]{\gdef\dnd@cha{#1}}

\newcommand{\abilityscores}[6]{%
	\setstrength{#1}
	\setdexterity{#2}
	\setconstitution{#3}
	\setintelligence{#4}
	\setwisdom{#5}
	\setcharisma{#6}}

\newcommand{\abilityscore}[2][]{%
	\begin{abs}[]\textbf{\Huge #1}\par\vspace*{1mm}\par{\tcbfontsize{0.9}\textsc{#2}}
	\end{abs}}

\newenvironment{abilitywrapper}{\begin{tcolorbox}[blankest]\begin{tcbraster}[raster columns=2, raster column skip=3mm]}{\end{tcbraster}\end{tcolorbox}}

\newtcolorbox{skillbox}{blankest, colback=cell, frame empty, width=\paperwidth/3-7mm-0.1in/3, top=1mm}

\newenvironment{skills}{\begin{skillbox}\begin{itemize}\item[\savesymb\rule{\skillw}{0.15mm}] \textsc{saving throws}}{\end{itemize}\end{skillbox}}

\newtcolorbox{abs}[1][]{enhanced, width=0.8in, height=0.7in, size=fbox,
	title={\phantom{+4}#1}, fonttitle={\huge}, center title, valign=bottom, halign=center,
	colframe=black, colback=white, colbacktitle=white, coltitle=black,
	left=0mm, right=0mm, bottom=0mm, boxrule=0.5mm,
	arc is angular, arc=1.5mm,
	attach boxed title to top center= {yshift=0.25mm-\tcboxedtitleheight/2, yshifttext=-1mm-\tcboxedtitleheight/2},
	boxed title style={boxrule=0.5mm,
		frame code={ \path[tcb fill frame]
			([xshift=-2mm]frame.west)
			-- ([yshift=.25mm, xshift=1mm]frame.north west)
			-- ([yshift=.25mm, xshift=-1mm]frame.north east)
			-- ([xshift=2mm]frame.east)
			-- ([xshift=-1mm,yshift=-1.8mm]frame.south east)
			-- ([xshift=1mm,yshift=-1.8mm]frame.south west)
			-- cycle; },
		interior code={ \path[tcb fill interior] 
			([xshift=-2mm]interior.west)
			-- ([yshift=.25mm, xshift=1mm]interior.north west)
			-- ([yshift=.25mm, xshift=-1mm]interior.north east)
			-- ([xshift=2mm]interior.east)
			-- ([xshift=-1mm,yshift=-1.6mm]interior.south east)
			-- ([xshift=1mm,yshift=-1.6mm]interior.south west)
			-- cycle;}
	}
}

% input: [arc]{height}
\newenvironment{tcbdoubleline}[2][3mm]{\begin{tcolorbox}[height=#2, colback=white, colframe=black, boxrule=0.5mm, boxsep=0pt, left=1mm, right=1mm, top=1mm, bottom=1mm, arc is angular, arc=#1]\begin{tcolorbox}[height=#2-3mm, colback=white, colframe=black, boxrule=0.5mm, boxsep=0pt, left=2mm, right=1mm, top=1mm, bottom=1mm, arc is angular, arc=#1-1mm]}{\end{tcolorbox}\end{tcolorbox}}
% input: [arc]{height}{width}
\newenvironment{tcbdoublelinew}[3][3mm]{\begin{tcolorbox}[height=#2, colback=white, width=#3, colframe=black, boxrule=0.5mm, boxsep=0pt, left=1mm, right=1mm, top=1mm, bottom=1mm, arc is angular, arc=#1]\begin{tcolorbox}[height=#2-3mm, colback=white, colframe=black, boxrule=0.5mm, boxsep=0pt, left=2mm, right=1mm, top=1mm, bottom=1mm, arc is angular, arc=#1-1mm]}{\end{tcolorbox}\end{tcolorbox}}

% input: [arc]{height}{color}
\newenvironment{tcbdoublefill}[3][3mm]{
\begin{tcolorbox}[height=#2,colback=#3, boxrule=0pt, boxsep=0pt, left=1mm, right=1mm, top=1mm, bottom=1mm, arc is angular, arc=#1]
	\begin{tcolorbox}[height=#2-2mm, colback=#3, colframe=white, boxrule=0.5mm, boxsep=0pt, left=1mm, right=1mm, top=1mm, bottom=1mm, arc is angular, arc=#1-1mm]
}{\end{tcolorbox}\end{tcolorbox}}


\newtcolorbox{gold}[1]{enhanced, width=15mm, height=8mm, size=fbox,
	title={#1}, fonttitle={\small}, halign title=right, halign=center, valign=center,
	coltitle=black, colbacktitle=white, colback=white,
	left=0mm, right=0mm, bottom=0mm, top=0mm, boxsep=0pt, boxrule=0.5mm,
	arc is angular, arc=2mm,
	attach boxed title to top left= {xshift=1.7mm-\tcboxedtitlewidth, yshift=-4mm-\tcboxedtitleheight/2},
	boxed title style={size=small,boxrule=0.5mm,
		frame code={ \path[tcb fill frame]
			([xshift=3mm, yshift=-.25mm]frame.south west)
			-- ([xshift=1mm, yshift=1.25mm]frame.south west)
			-- ([xshift=1mm, yshift=-1.25mm]frame.north west)
			-- ([xshift=3mm, yshift=.25mm]frame.north west)
			-- ([xshift=0.5mm, yshift=0mm]frame.north)
			-- ([xshift=1.5mm, yshift=0.75mm]frame.north)
			-- ([xshift=0mm, yshift=0.75mm]frame.north east)
			-- ([xshift=-1.25mm, yshift=-0.5mm]frame.north east)
			-- ([xshift=-1.25mm, yshift=0.5mm]frame.south east)
			-- ([xshift=0mm, yshift=-0.75mm]frame.south east)
			-- ([xshift=1.5mm, yshift=-0.75mm]frame.south)
			-- ([xshift=0.5mm, yshift=0mm]frame.south)
			-- cycle; },
		interior code={ \path[tcb fill interior] 
			([xshift=3mm, yshift=-.25mm]interior.south west)
			-- ([xshift=1mm, yshift=1.25mm]interior.south west)
			-- ([xshift=1mm, yshift=-1.25mm]interior.north west)
			-- ([xshift=3mm, yshift=.25mm]interior.north west)
			-- ([xshift=0.5mm, yshift=-0.5mm]interior.north)
			-- ([xshift=1.5mm, yshift=0.75mm]interior.north)
			-- ([xshift=-0.5mm, yshift=0.75mm]interior.north east)
			-- ([xshift=-1.5mm, yshift=-0.25mm]interior.north east)
			-- ([xshift=-1.5mm, yshift=0.25mm]interior.south east)
			-- ([xshift=-0.5mm, yshift=-0.75mm]interior.south east)
			-- ([xshift=1.5mm, yshift=-0.75mm]interior.south)
			-- ([xshift=0.5mm, yshift=0.5mm]interior.south)
			-- cycle; }
	}
}

%%%%%%% TODO: make these better
\newcommand{\profbonus}{\begin{tcolorbox}\textsc{proficiency bonus}\end{tcolorbox}}
\newcommand{\passivewis}{\begin{tcolorbox}\textsc{passive wisdom (perception)}\end{tcolorbox}}
\newcommand{\armorclass}{\begin{tcolorbox}[height=\paperheight/12-3mm,left=1mm, right=1mm, top = 1mm, bottom=1mm]Armor Class\end{tcolorbox}}
\newcommand{\initiative}{\begin{tcolorbox}[height=\paperheight/12-3mm,left=1mm, right=1mm, top = 1mm, bottom=1mm]Initiative\end{tcolorbox}}
\newcommand{\speed}{\begin{tcolorbox}[height=\paperheight/12-3mm,left=1mm, right=1mm, top = 1mm, bottom=1mm]Speed\end{tcolorbox}}
\newcommand{\currhitpoints}{\begin{tcolorbox}[height=\paperheight/12-3mm]
		Current Hit Points
\end{tcolorbox}}
\newcommand{\temphitpoints}{\begin{tcolorbox}[height=\paperheight/12-3mm]
		Temp Hit Points
\end{tcolorbox}}
\newcommand{\hitdice}{\begin{tcolorbox}[height=\paperheight/12-3mm,left=1mm, right=1mm, top = 1mm, bottom=1mm]Hit dice\end{tcolorbox}}
\newcommand{\deathsaves}{\begin{tcolorbox}[height=\paperheight/12-3mm,left=1mm, right=1mm, top = 1mm, bottom=1mm]Death saves\end{tcolorbox}}

\newcommand{\skill}[1]{\itemskip\item[\skillsymb\rule{\skillw}{0.15mm}]\textsc{#1}}

\newcommand{\constructabilities}{ % TODO: calc modifiers
	\profbonus
	\begin{abilitywrapper}
		\abilityscore[\dnd@str]{strength}%
		\begin{skills}
			\skill{athletics}
		\end{skills}
	\end{abilitywrapper}
	\begin{abilitywrapper}
		\abilityscore[\dnd@dex]{dexterity}%
		\begin{skills}
			\skill{acrobatics}
			\skill{sleight of hand}
			\skill{stealth}
		\end{skills}
	\end{abilitywrapper}
	\begin{abilitywrapper}
		\abilityscore[\dnd@con]{constitution}%
		\begin{skills}
		\end{skills}
	\end{abilitywrapper}
	\begin{abilitywrapper}
		\abilityscore[\dnd@int]{intelligence}%
		\begin{skills}
			\skill{arcana}
			\skill{history}
			\skill{investigation}
			\skill{nature}
			\skill{religion}
		\end{skills}
	\end{abilitywrapper}
	\begin{abilitywrapper}
		\abilityscore[\dnd@wis]{wisdom}%
		\begin{skills}
			\skill{animal handling}
			\skill{insight}
			\skill{medicine}
			\skill{perception}
			\skill{survival}
		\end{skills}
	\end{abilitywrapper}
	\passivewis
	\begin{abilitywrapper}
		\abilityscore[\dnd@cha]{charisma}%
		\begin{skills}
			\skill{deception}
			\skill{intimidation}
			\skill{performance}
			\skill{persuasion}
		\end{skills}
	\end{abilitywrapper}
}