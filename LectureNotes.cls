% -------------------------------------------------------
% Lecture Notes 2024
% designed by Yang, Department of Applied Geophysics, CSU

\ProvidesPackage{LectureNotes}[2024/05/29]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[openany,twoside,scheme=chinese]{ctexbook}

% -------------------------------------------------------
% 基本信息

\newcommand{\note@title}{工程电路分析}
\newcommand{\note@entitle}{Engineering Circuit Analysis}
\newcommand{\note@editor}{二}
\newcommand{\note@eneditor}{Second Edition}
\newcommand{\note@author}{Y. Yaokun}

% -------------------------------------------------------
% 字体

\RequirePackage{fontspec}
\PassOptionsToPackage{quiet}{fontspec}

% \newfontfamily\opposans[Path=fonts/]
% {OPPOSans-Bold.ttf}
\setCJKfamilyfont{opposans}{OPPOSans-Regular.ttf}
\newcommand{\opposans}{\CJKfamily{opposans}}
\newfontfamily\kumbhsans[Path=fonts/]{kumbh-sans-latin-600-normal.ttf}
\newfontfamily\kumbhsanslight[Path=fonts/]{kumbh-sans-latin-300-normal.ttf}
\newfontfamily\cormorantsc[Path=fonts/]
{CormorantSC-Medium-3.ttf}

\RequirePackage{anyfontsize}

% -------------------------------------------------------
% 文档结构

\ctexset{
    chapter={
        format=\zihao{-2}\heiti,
        pagestyle=empty,
        beforeskip=3em,
        afterskip=2em,
    },
    section={
        format=\zihao{4}\heiti,
        beforeskip=1em,
        afterskip=1em,
    },
    subsection={
        format=\zihao{-4}\heiti,
        beforeskip=1em,
        afterskip=1em,
    }
}

% -------------------------------------------------------
% 版面设计

\RequirePackage{geometry}
\geometry{paperheight=260mm,paperwidth=185mm,top=18mm,bottom=20mm,inner=18mm,outer=17mm}
\RequirePackage{fancyhdr}
\fancypagestyle{heading}{
    \fancyhf{}
    \fancyhead[CE]{\kaishu\zihao{-5}\note@title}
    \fancyhead[CO]{\kaishu\zihao{-5}\rightmark}
    \fancyhead[LE,RO]{\kaishu\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0pt}
}
\RequirePackage{indentfirst}

% -------------------------------------------------------
% 颜色

\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}

\definecolor{cover@dark}{RGB}{1,1,3} % 封面色
\definecolor{cover@light}{RGB}{188,212,114} % 封面色

% -------------------------------------------------------
% 数学

\RequirePackage{amsfonts,amsmath,amssymb}
\RequirePackage{amsthm}
\RequirePackage[scr=boondox,cal=esstix]{mathalpha}
\RequirePackage{mathrsfs}

% -------------------------------------------------------
% 图表

\RequirePackage{titling}
\RequirePackage{tabularx,colortbl}
\RequirePackage{tabularray}
\UseTblrLibrary{siunitx}
\UseTblrLibrary{booktabs}
\RequirePackage{subfigure}
\RequirePackage{wrapfig}
\RequirePackage{subcaption}
\RequirePackage[strict]{changepage}
\RequirePackage{framed}
\RequirePackage{float}
\RequirePackage{fontawesome5}

% -------------------------------------------------------
% minted代码块

\RequirePackage{minted}
\usemintedstyle{lovelace}

% -------------------------------------------------------
% tcb盒子

\RequirePackage{tcolorbox}
\tcbuselibrary{skins}
\tcbuselibrary{minted}
\tcbuselibrary{breakable,theorems}

% -------------------------------------------------------
% 绘图

\RequirePackage{tikz}
\RequirePackage{circuitikz}
\usetikzlibrary{positioning}
\usetikzlibrary{calc,fadings,patterns}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

% -------------------------------------------------------
% lst代码块

\RequirePackage{listings}
\lstset{
    language=Matlab,% 设置代码语言为Matlab
    basicstyle=\ttfamily,
    numbers=left,
    numberstyle=\tiny,
    stepnumber=1,
    numbersep=7pt,
    backgroundcolor=\color{gray!10},% 设置代码的背景颜色
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    frame=single,% 设置代码框形式
    rulecolor=\color{black},
    tabsize=2,
    captionpos=t,% 设置文件名位置
    breaklines=true,
    breakatwhitespace=true,
    title=\lstname,
    morekeywords={matlabFunction, end},
}
% -------------------------------------------------------
% 环境

\newenvironment{quote}{%
\def\FrameCommand{%
\hspace{1pt}%
{\color{DarkBlue}\vrule width 2pt}%
{\color{formalshade}\vrule width 4pt}%
\colorbox{formalshade}%
}%
\MakeFramed{\advance\hsize-\width\FrameRestore}%
\noindent\hspace{-4.55pt}% disable indenting first paragraph
\begin{adjustwidth}{}{7pt}%
\vspace{2pt}\vspace{2pt}%
}
{%
\vspace{2pt}\end{adjustwidth}\endMakeFramed%
}

\newtcolorbox{prob}[1]{
% Set box style
    sidebyside,
    sidebyside align=top,
% Dimensions and layout
    width=\textwidth,
    toptitle=2.5pt,
    bottomtitle=2.5pt,
    righthand width=0.20\textwidth,
% Coloring
    colbacktitle=gray!30,
    coltitle=black,
    colback=white,
    colframe=black,
% Title formatting
    title={
        #1 \hfill Grade:\phantom{WWWW}
    },
    fonttitle=\bfseries
}

\newenvironment{problem}[1]{
    \begin{prob}{#1}
}
{
    \tcblower
    \centering
    \textit{\scriptsize\bfseries Faculty Comments}
    \vspace{\baselineskip}
    \end{prob}
}

% -------------------------------------------------------
% 参考文献

\RequirePackage{gbt7714}
\citestyle{numbers}

% -------------------------------------------------------
% 封面页

\def\makecover{%
    \thispagestyle{empty}
    \begin{titlepage}
        \begin{tikzpicture}[remember picture,overlay]
            % 背景颜色
            \fill[cover@dark](current page.north west) rectangle (current page.south east);
            \fill[cover@light](current page.south east)
            rectangle ++(-.9\paperwidth,.63\paperheight);
            \fill[cover@dark]([shift={(-1.85cm,3.4cm)}]current page.south east) rectangle ++(-.70\paperwidth,.42\paperheight);
            \node at ([shift={(-.45\paperwidth,.35\paperheight)}]current page.south east){\includegraphics[width=12cm]{Fig/coverimg.png}};
            % 作者信息
            \node[text=white,anchor=east,align=right,scale=1.2,font=\kumbhsanslight] at ([shift={(-1.8cm,-2.9cm)}]current page.north east)
            {\faCat{}\space\note@author};
            % 标题与版本
            \node[text=cover@light,anchor=east,align=right,scale=2,font=\kumbhsans] at ([shift={(-1.7cm,-5.58cm)}]current page.north east)
            {\note@entitle};
            \node[text=cover@light,anchor=east,align=right,scale=1.5,font=\kumbhsanslight] at ([shift={(-1.7cm,-6.3cm)}]current page.north east)
            {\note@eneditor};
            \node[text=cover@light,anchor=east,align=right,scale=1.8,font=\opposans] at ([shift={(-1.7cm,-8.0cm)}]current page.north east)
            {\note@title};
            \node[text=cover@light,anchor=east,align=right,scale=1.2,font=\opposans] at ([shift={(-1.8cm,-9.0cm)}]current page.north east)
            {第\note@editor 版};
            % 出版商
            \node at ([shift={(1.8cm,-2.9cm)}]current page.north west){\includegraphics[width=0.5cm]{Fig/AcademiconsSpringer.png}};
            \node[text=white,anchor=west,align=left,scale=1.2] at ([shift={(2.1cm,-2.9cm)}]current page.north west)
            {Springer};
            \node[text=cover@dark,anchor=east,align=right,scale=1.1,font=\heiti] at ([shift={(-1.7cm,1.5cm)}]current page.south east)
            {\faOtter{} 低等教育出版社};
        \end{tikzpicture}
    \end{titlepage}
    \newpage
}

% 标题页
\def\maketitlepage{%
    \thispagestyle{empty}
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{center}
            {\makeatletter
            \phantom{1}
            
            \bigskip
            \bigskip
            \bigskip

            \heiti\Huge\note@title

            \bigskip
            \bigskip

            \makeatother
            }
            {\makeatletter
            \Large\heiti（第\note@editor 版）

            \bigskip
            \bigskip

            \makeatother
            }
            {\makeatletter
            \bigskip
            \bigskip
            \cormorantsc\huge\note@entitle
            \bigskip
            \bigskip
            \makeatother
            }
            {\makeatletter

            \cormorantsc\Large\note@eneditor\space Editor
            \bigskip
            \bigskip
            \makeatother
            }
            {\makeatletter
            
            \large\faCat{}\space \note@author
            \bigskip
            \bigskip
            \makeatother
            }

            \vspace*{11cm}

            {\Large 长沙 $\cdot$ CHANGSHA}
        \end{center}
    \end{titlepage}
    \let\cleardoublepage\clearpage

    \thispagestyle{empty}
    \phantom{1}

    \vspace{16.3cm}

    \noindent Copyright ©2024 by Y.K. Yang.

    \noindent 版权所有。未经出版人事先书面许可，对本出版物的任何部分不得以任何方式或途径复制传播，包括但不限于复制、录制、录音，或通过任何数据库、信息或可检索的系统。

    \noindent 此版本仅限在中华人民共和国境内（不包括香港特别行政区、澳门特别行政区和台湾）销售。

    \bigskip

    \noindent All Rights reserved. No part of this publication may be reproduced or transmitted in any form or by any means, electronic system, without the prior written permission of the publisher.

    \noindent The edition is authorized for sale in the People's Republic of China only, excluding Hong Kong SAR, Macao SAR and Taiwan.
}

% 封底
\def\makeback{%
    \thispagestyle{empty}
    \begin{titlepage}
        \begin{tikzpicture}[remember picture,overlay]
            \fill[cover@dark](current page.north west) rectangle (current page.south east);
        \end{tikzpicture}
    \end{titlepage}
    \newpage
}