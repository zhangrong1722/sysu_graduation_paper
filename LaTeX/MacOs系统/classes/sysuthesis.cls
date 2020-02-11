% 中山大学电子与信息工程学院研究生毕业论文模板
% 本模板的参考模板为陈颂光、黄俊杰等中大校友发布于Github上的维护项目所提供的本科生毕业论文Latex开源代码，感谢各位校友作出的突出贡献
% 定义模板样式
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sysuthesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[
    %fontset=adobe,
    %fontset=fandol,    % texlive自带，可移植字体库，只有常用的6763个汉字
    %fontset=ubuntu,
    fontset=mac,
    %fontset=windows,
    a4paper,
    %openright,
    openany,
    zihao=-4
]{ctexbook}

%\def\@printtwoside{0} % 设置文章为电子版格式（不添加多余空白页）
\def\@printtwoside{1} % 设置文章为双面打印格式（添加多余空白页保证每个表格、章节开头为奇数页面）

% 配置英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

\RequirePackage[margin=1in,headsep=.2in, headheight=2in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage[labelsep=space]{caption}
\RequirePackage[font=footnotesize]{subcaption}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage[section]{placeins}
\RequirePackage[chinese, onelanguage,linesnumbered,algochapter,ruled,vlined]{packages/algorithm2e}
\RequirePackage{enumitem}
\RequirePackage{bbm}
\RequirePackage{bm}
\RequirePackage[notlof,notlot,nottoc,numbib]{tocbibind} %table of content
\RequirePackage{tocloft}
\RequirePackage{wrapfig}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage[bottom, perpage]{footmisc}
\RequirePackage{setspace}
\RequirePackage{datetime}
\RequirePackage{nth}

% 引入调整段落整体宽度的宏包
\RequirePackage{changepage}

% Insert a TRUE blank page which has no header or footer
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{
    \clearpage{
        \pagestyle{empty}
        \origdoublepage
    }
}
% 定义了一种新的clearpage方式，允许一个变量切换电子版及双面打印版
\newcommand{\newclearpage}{
    \if\@printtwoside1
        \clearemptydoublepage
    \else
        \clearpage
    \fi
}

% 设定时间为中文日期
\ctexset{today=small}

\AtBeginDocument{
    \hypersetup{
        citecolor=green,
        filecolor=black,
        linkcolor=black,
        urlcolor=black,
        CJKbookmarks=true,
        pdftitle={\@ctitle},
        pdfauthor={\@cauthor},
        pdfkeywords={\@ckeywords},
        pdfcreator={LaTeX with hyperref package, using SYSU undergraduate Thesis LaTeX Template}
    }
}
\pagestyle{fancy}

% 有序与无序列表环境
\setlist[enumerate]{nosep}
\renewcommand\labelenumi{\theenumi)}
\setlist[itemize]{nosep}
\setlist[description]{nosep}

% 页眉、页脚、脚注设定
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{ \markboth{#1}{} }
% 采用带圈数字符号代替*号脚注
\xeCJKsetcharclass{`①}{`⑩}{1}
% 默认页面页眉页脚样式
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[C]{\zihao{-5}\thepage} % 页码位于页脚居中

    % 左右两栏页眉，左为论文题目右为当前章
%    \fancyhead[L]{\zihao{-5}\@ctitle}
%    \fancyhead[R]{\zihao{-5}\leftmark}
    % 居中式页眉
    \fancyhead[CO]{\zihao{-5}{中山大学\@degree 学位论文}}
    \fancyhead[CE]{\zihao{-5}\@ctitle}
    %\fancyhead[C]{\zihao{-5}\leftmark}
}
\pagestyle{plain}

% 中英文摘要页面样式
\fancypagestyle{cAbstract}{
   \fancyhead[CO]{\zihao{-5}{中山大学\@degree 学位论文}}
   \fancyhead[CE]{\zihao{-5}\@ctitle}
}
\fancypagestyle{eAbstract}{
    \fancyhead[CO]{\zihao{-5}{中山大学\@degree 学位论文}}
    \fancyhead[CE]{\zihao{-5}\@ctitle}
}

% 表格与图片标题设定
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\setlength\heavyrulewidth{0.2em}
\captionsetup{font=small,format=hang}


% 目录设定，使用tocloft宏包
\setcounter{secnumdepth}{3} % depth of toc, 2
\setcounter{tocdepth}{1}
% 如果要在目录中显示子章节请换用下面这行(目录中显示到x.y.z章)，如果不用这行默认显示到x.y章。
% \setcounter{tocdepth}{2}

% 目录标题：小二号黑体加粗
\renewcommand{\cfttoctitlefont}{\hfill\zihao{-2}\heiti\bfseries}
\renewcommand{\cftlottitlefont}{\hfill\zihao{-2}\heiti\bfseries}
\renewcommand{\cftloftitlefont}{\hfill\zihao{-2}\heiti\bfseries}

% 目录中章节标题：四号黑体
\renewcommand{\cftchapfont}{\zihao{4}\heiti}
\renewcommand{\cftchappagefont}{\zihao{4}\heiti}

% 目录中其他内容：小四号宋体
\renewcommand{\cftsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsecpagefont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecpagefont}{\zihao{-4}\songti}
\setlength{\cftsecindent}{2.3em}        % 小节缩进, 对齐章标题空隙

\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftnodots}{\cftdotsep}     % 使用点指示页数

\addtolength{\cftchapnumwidth}{3\ccwd}
\newcommand\mybold[1]{\textit{\textbf{#1}}}

\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newtheoremstyle{dotless}{3pt}{3pt}{\kaishu}{2em}{\heiti}{}{\ccwd}{}
\theoremstyle{dotless}
\newtheorem{theorem}{{定理}}[chapter]
\newtheorem{proposition}{{命题}}[chapter]
\newtheorem{lemma}{{引理}}[chapter]
\newtheorem{corollary}{{推论}}[chapter]
\newtheorem{definition}{{定义}}[chapter]
\newtheorem{remark}{{注记}}[chapter]
\newtheorem{eg}{例}[chapter]

\renewcommand{\proofname}{{\heiti 证明}}
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}
    \kaishu \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item[\hskip\labelsep
                \itshape
        #1]\ignorespaces
}{
    \popQED\endtrivlist\@endpefalse
}

% 参考文献引用标记格式：右上角，带方括号
\RequirePackage[square,sort&compress,super]{natbib}

% 相关信息宏定义
\newcommand\ctitle[1]{\def\@ctitle{#1}}
\newcommand\etitle[1]{\def\@etitle{#1}}
\newcommand\cauthor[1]{\def\@cauthor{#1}} % 默认中文名为封面作者名字
\newcommand\eauthor[1]{\def\@eauthor{#1}}
\newcommand\studentid[1]{\def\@studentid{#1}}
\newcommand\cschool[1]{\def\@cschool{#1}}
\newcommand\cmajor[1]{\def\@cmajor{#1}}
\newcommand\emajor[1]{\def\@emajor{#1}}
\newcommand\cmentor[1]{\def\@cmentor{#1}}
\newcommand\ementor[1]{\def\@ementor{#1}}
\newcommand\degree[1]{\def\@degree{#1}}

\renewcommand\maketitle {
    \begin{titlepage}
        \begin{center}
        	\leavevmode\renewcommand{\baselinestretch}{1.5}
        	
            \vspace{2\baselineskip}
            {\songti \zihao{1}\textbf{中山大学\@degree 学位论文}} \\
            
            \vspace{3.5\baselineskip}
           { \zihao{4}\begin{tabular}{ll}
            		\textbf{中文题目：} & \@ctitle \\
            		\textbf{英文题目：} & \@etitle
            	\end{tabular}\\
            	\vspace{3.5\baselineskip}
            	
            	 \begin{tabular}{ll}
            		{\makebox[3cm][s]{\textbf{专 \hfill 业：} }} & \@cmajor \\
            		{\makebox[3cm][s]{\textbf{学 \hfill 位 \hfill 申 \hfill 请 \hfill 人：}}}& \@cauthor \\
            		{\makebox[3cm][s]{\textbf{\textbf{导 \hfill 师 \hfill 姓 \hfill 名：}}}} & \@cmentor \\ 
            \end{tabular}%
        
        	\vspace{4\baselineskip}
	        \begin{tabular}{rr}
	        	论文答辩委员会主席： & \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}\\
	        	成员：& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}\\
	        	{}& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}\\
	        	{}& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}
	        \end{tabular}}
        
            
            \vfill

            \zihao{-3}
            {\centering
                \ctexset{today=big}         % 汉字数字形式日期
                \today     \\ % 使用最后一次编译的日期, 实现日期的自动化
            }

        \end{center}
    \end{titlepage}
    \newclearpage
}

% 开题报告
\newcommand\objective[1]{\def\@objective{#1}}
\newcommand\methodology[1]{\def\@methodology{#1}}
\newcommand\researchProcedure[1]{\def\@researchProcedure{#1}}
\newcommand\supportment[1]{\def\@supportment{#1}}
\newcommand\schedule[1]{\def\@schedule{#1}}
\newcommand\proposalInstructions[1]{\def\@proposalInstructions{#1}}

\newcommand\makeProposal{
	\pagestyle{empty}
	
	\begin{center}
		\zihao{3}\fangsong\bfseries
		表一\hspace{\ccwd}毕业论文开题报告 \\
	\end{center}
	%\addcontentsline{toc}{chapter}{表一 毕业论文（设计）开题报告}
	
	\zihao{-4}\songti
	\begin{longtable}{|p{\textwidth}|}
		% 第一页出现的表头
		\hline
		论文(设计)题目: \\
		\@ctitle
		\endfirsthead
		
		% 中间页出现的表头
		\hline
		%(前接)
		\endhead
		
		% 中间页出现的表脚
		%(后续) \\
		\hline
		\endfoot
		
		% 表格最后一页的表脚
		%\hline
		指导教师意见：\\
		\@proposalInstructions  \\
		\vspace{\baselineskip}
		
		\begin{tabular}{l l l}
			1. 同意开题     & 2. 修改后开题                     & 3. 重新开题           \\
		\end{tabular}
		
		\vspace{\baselineskip}
		\hspace{2\ccwd}指导教师签名:\hfill \quad 年\quad 月\quad 日\\
		\rule{0cm}{\baselineskip}\\
		\hline
		\endlastfoot
		
		\hline
		(简述选题的目的、思路、方法、相关支持条件及进度安排等)\\
		\textbf{选题目的:}  \\
		\@objective
		\vspace{\baselineskip}
		
		\textbf{思路:}  \\
		\@methodology
		\vspace{\baselineskip}
		
		\textbf{方法:}  \\
		\@researchProcedure
		\vspace{\baselineskip}
		
		\textbf{相关支持条件:}  \\
		\@supportment
		\vspace{\baselineskip}
		
		\textbf{进度安排:}  \\
		\@schedule
		\vspace{\baselineskip}
		\vfill
		
		\hspace{2\ccwd}学生签字:\hfill \quad 年\quad 月\quad 日 \\
		\rule{0cm}{\baselineskip}\\
		\hline
	\end{longtable}
	\newclearpage
}

% 用到的变量
% 四次过程报告自述
\newcommand\firstsummary[1]{\def\@firstsummary{#1}}
\newcommand\secondsummary[1]{\def\@secondsummary{#1}}
\newcommand\thirdsummary[1]{\def\@thirdsummary{#1}}
\newcommand\fourthsummary[1]{\def\@fourthsummary{#1}}
% 四次老师的评价
\newcommand\firstcomment[1]{\def\@firstcomment{#1}}
\newcommand\secondcomment[1]{\def\@secondcomment{#1}}
\newcommand\thirdcomment[1]{\def\@thirdcomment{#1}}
\newcommand\fourthcomment[1]{\def\@fourthcomment{#1}}
% 老师最后评价
\newcommand\finalcomment[1]{\def\@finalcomment{#1}}

% 进度检查记录表
\newcommand\makeProgressCheck{
	\pagestyle{empty}
	
	\begin{center}
		\zihao{3}\fangsong\bfseries
		表二\hspace{\ccwd}毕业论文过程检查记录表 \\
	\end{center}
	
	\zihao{-4}\songti
	\begin{longtable}{|c|l|}
		% 中间页出现的表头
		\hline
		\endhead
		
		% 中间页出现的表脚
		%(后续) \\
		\hline
		\endfoot
		
		%最后部分的表脚
		\hline
		& 指导教师意见：\\
		&  \\
		&  \\
		&  \\
		\newline
		\textbf{总体完成情况} & 1、按计划完成，完成情况优：（\quad）\\
		& 2、按计划完成，完成情况良：（\quad）\\
		& 3、基本按计划完成，完成情况合格：（\quad）\\
		& 4、完成情况不合格：（\quad）\\
		& \\
		& 指导教师签名:\\
		& \\
		& 日期：\\
		& \\
		\hline
		\endlastfoot
		
		\multicolumn{2}{|p{\textwidth}|}{
			\bfseries{指导教师分阶段检查论文的进展情况（要求过程检查记录不少于3次）} \newline
			\vspace{\baselineskip}
		}\\
		% 第一次检查
		\multicolumn{2}{|p{\textwidth}|} {
			\textbf{第一次检查}  \newline
			\begin{adjustwidth}{2em}{2em}
				学生总结：
			\end{adjustwidth}
			\@firstsummary
			\vspace{\baselineskip}
			\begin{adjustwidth}{2em}{2em}
				指导教师意见：
			\end{adjustwidth}
			\@firstcomment
			\vspace{\baselineskip}
		}\\
		% 第二次检查
		\multicolumn{2}{|p{\textwidth}|} {
			\textbf{第二次检查}  \newline
			\begin{adjustwidth}{2em}{2em}
				学生总结：
			\end{adjustwidth}
			\@secondsummary
			\vspace{\baselineskip}
			\begin{adjustwidth}{2em}{2em}
				指导教师意见：
			\end{adjustwidth}
			\@secondcomment
			\vspace{\baselineskip}
		}\\
		
		% 第三次检查
		\multicolumn{2}{|p{\textwidth}|} {
			\textbf{第三次检查}  \newline
			\begin{adjustwidth}{2em}{2em}
				学生总结： 
			\end{adjustwidth}
			\@thirdsummary
			\vspace{\baselineskip}
			\begin{adjustwidth}{2em}{2em}
				指导教师意见：
			\end{adjustwidth}
			\@thirdcomment
			\vspace{\baselineskip}
		}\\
		
		% 第四次检查
		\multicolumn{2}{|p{\textwidth}|} {
			\textbf{第四次检查}  \newline
			\begin{adjustwidth}{2em}{2em}
				学生总结： 
			\end{adjustwidth}
			\@fourthsummary
			\vspace{\baselineskip}
			\begin{adjustwidth}{2em}{2em}
				指导教师意见： 
			\end{adjustwidth}
			\@fourthcomment
			\vspace{\baselineskip}
		}\\
		
		% 结尾落款部分
		\multicolumn{2}{|p{\textwidth}|}{
			\vspace{1cm} \newline
			\hspace{2\ccwd}学生签名:\hfill \quad 年\quad 月\quad 日\makebox{\hspace{5\ccwd}} \newline
			\rule{0cm}{\baselineskip}\newline
			\hspace{2\ccwd}指导教师签名:\hfill \quad 年\quad 月\quad 日\makebox{\hspace{5\ccwd}} \newline
			\rule{0cm}{\baselineskip}
		}\\
	\end{longtable}
	\newclearpage
}

% 答辩情况登记表
\newcommand\makeDefenseRecord{
	\pagestyle{empty}
	
	\begin{center}
		\zihao{3}\fangsong\bfseries
		表三\hspace{\ccwd}毕业论文（设计）答辩情况登记表 \\
	\end{center}
	
	\zihao{-4}\songti
	\begin{longtable}{|c|c|c|c|}
		% 第一页出现的表头
		\hline
		\textbf{答辩人} & \@cauthor & \textbf{专业} & \@cmajor \\
		\hline
		\textbf{论文(设计)题目} & \multicolumn{3}{c|}{\@ctitle} \\
		\hline
		\textbf{答辩小组成员} & \multicolumn{3}{c|}{\quad} \\
		\endfirsthead
		
		% 中间页出现的表头
		\hline
		%(前接)
		\endhead
		
		% 中间页出现的表脚
		%(后续) \\
		\hline
		\endfoot
		
		% 表格最后一页的表脚
		\hline
		\multicolumn{4}{|p{\textwidth}|}{
			% 按照论文原格式是两个字符的缩进
			\begin{adjustwidth}{2em}{2em}
				答辩记录： \newline
			\end{adjustwidth}	
			\vspace{18cm}
			\hspace{2\ccwd}记录人签名:\hfill \quad 年\quad 月\quad 日\makebox{\hspace{5\ccwd}}
			\vspace{\baselineskip}
		}
		\\
		\hline
	\end{longtable}
	\newclearpage
}

\newcommand\makedisclaim{
    \ctexset {
        chapter = {
            titleformat = {\zihao{-2}\fangsong\bfseries},
            beforeskip = {10pt},
            afterskip = {40pt}
        }
    }
    \input{docs/disclaim}
    \thispagestyle{empty}
    \newclearpage
}

% 摘要
\newcommand\ckeywords[1]{\def\@ckeywords{#1}}
\newcommand\ekeywords[1]{\def\@ekeywords{#1}}
\newcommand\cabstract[1]{\def\@cabstract{#1}}
\newcommand\eabstract[1]{\def\@eabstract{#1}}

% 中文摘要、关键字标题：5号黑体并加方括号
% 中文摘要、关键字内容：5号楷体
\newcommand\makecabstract{
	\ctexset{
		section = {
			titleformat = {\zihao{4}\heiti},
			beforeskip = {10pt},
			afterskip = {20pt}
		},
		paragraph/format = {}
	}
	\begin{center}
			\zihao{-4}
			\textbf{论文题目}：\mbox{ }\@ctitle \\
			\textbf{专业}： \mbox{ }\@cmajor \\
			\textbf{\@degree 生}：\mbox{ }\@cauthor \\
			\textbf{指导教师}：\mbox{ }\@cmentor \\
	\end{center}
	\centerline{\heiti\zihao{-2}\bfseries{摘\hspace{2\ccwd}要}}
	 \vspace{10pt}
	 
	\zihao{-4}
	\@cabstract
	\paragraph{\zihao{-4}\heiti[关键词]}\@ckeywords
	\addcontentsline{toc}{chapter}{摘要}
}

% 英文摘要、关键字标题：小四号新罗马体(Time New Roman)加粗并加方括号
% 英文摘要、关键字内容：小四号新罗马体(Time New Roman)
\newcommand\makeeabstract{
	\ctexset{
		section = {
			titleformat = {\zihao{4}\bfseries},
			beforeskip = {10pt},
			afterskip = {20pt}
		}
	}
	
	\begin{center}
		\zihao{-4}
		\textbf{Title:} \mbox{ } \@etitle\\
		\textbf{Major:} \mbox{ } \@emajor \\
		\textbf{Name:} \mbox{ } \@eauthor\\
		\textbf{Supervisor:} \mbox{ } \@ementor
	\end{center}
	
	\centerline{\zihao{-2}\bfseries{ABSTRACT}}
	 \vspace{10pt}
	
	\zihao{-4}
	\@eabstract
	\paragraph{\textbf{[Keywords]}}\@ekeywords
	\addcontentsline{toc}{chapter}{ABSTRACT}
}

\newcommand\makeabstract{
	\setcounter{page}{1}
	\pagestyle{cAbstract}
	\makecabstract
	\newclearpage
	
	\pagestyle{eAbstract}
	\makeeabstract
	\newclearpage
}
\newcommand\maketableofcontents{
    \pagestyle{plain}
    \tableofcontents
    \newclearpage
}
\newcommand\makelistoffiguretable{
    \listoffigures
    \listoftables
    \thispagestyle{listoffiguretable}
    \newclearpage
}

\renewcommand\mainmatter{
    \@mainmattertrue
    %\fancypagestyle{plain}{ \fancyhead[R]{\zihao{-5} 第 \thechapter 章 \leftmark} }
    \pagenumbering{arabic}
    \ctexset {
        chapter = {
            %fixskip = true,
            name = {第,章},
            number = {\thechapter},
            beforeskip = {10pt},
            afterskip = {20pt},
            format = {\centering},
            nameformat = {\zihao{-2}\heiti},
            titleformat = {\zihao{-2}\heiti}
        },
        section = {
            %fixskip = true,
            beforeskip = {20pt},
            afterskip = {10pt},
            format = {},
            nameformat = {\zihao{-3}\heiti},
            titleformat = {\zihao{-3}\heiti}
        },
        subsection = {
            %fixskip = true,
            beforeskip = {20pt},
            afterskip = {10pt},
            format = {},
            nameformat = {\zihao{4}\heiti},
            titleformat = {\zihao{4}\heiti}
        },
        subsubsection = {
            beforeskip = {20pt},
            afterskip = {10pt},
            format = {},
            nameformat = {\zihao{4}\heiti},
            titleformat = {\zihao{4}\heiti}
            % 按照中大规定的格式需要显示成a.b.c.d章，而不是(d)节
            % number = {(\arabic{subsubsection})}
        }
    }

    \zihao{-4}\songti \linespread{1.5}\selectfont
    \pagestyle{plain}
}

\renewcommand\backmatter{
    \@mainmatterfalse
%    \fancypagestyle{plain}{ \fancyhead[R]{\zihao{-5} \leftmark} }
    \pagestyle{plain}
}

% 参考文献
% 内容五号宋体
\newcommand\makereferences{
    \begingroup
    \ctexset {
    	chapter = {
    		aftertitle = {},
    		format = {\centering},
    		titleformat = {\zihao{-2}\heiti}
    	}
    }

        % 引用样式
        %\bibliographystyle{bibtex-style/ieeetr}         % 国际标准样式
        \bibliographystyle{Bibliography/bibtex-style/gbt7714-2005}    % 国标文后参考文献著录规则
        %\bibliographystyle{bibtex-style/sysuthesis}     % 历史遗留模板
        %\bibliographystyle{bibtex-style/sysuthesis2}     % 2017年由程建生师兄提供的模板
        {\zihao{5}\rmfamily\bibliography{Bibliography/Reference}}    % 引用文献列表
    \endgroup
}

% 附录样式
\renewcommand\appendix{\par
    \@mainmattertrue
%    \fancypagestyle{plain}{
%        \fancyhead[R]{\zihao{-5} 附录\thechapter \leftmark}
%    }
    \pagestyle{plain}
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \gdef\@chapapp{\appendixname}
    \gdef\thechapter{\@Alph\c@chapter}
    \gdef\CTEX@prechapter{\CTEX@preappendix}
    \gdef\CTEX@thechapter{\CTEX@appendix@number}
    \gdef\CTEX@postchapter{}
    \ctexset {
        chapter = {
            format = {\centering},
            nameformat = {\zihao{-2}\heiti},
            titleformat = {\zihao{-2}\heiti},
        },
        section = {
        	name = {附},
            format = {},
            nameformat = {\zihao{-3}\heiti},
            titleformat = {\zihao{-3}\heiti}
        },
        subsection = {
        	name = {附},
            format = {},
            nameformat = {\zihao{4}\heiti},
            titleformat = {\zihao{4}\heiti}
        }
    }
}

%成绩评定记录表
\newcommand\gradingComment[1]{\def\@gradingComment{#1}}
\newcommand\makeGrade{
    \pagestyle{empty}
    \linespread{1.2}
    \begin{center}
        \zihao{3}\fangsong\bfseries
        毕业论文(设计)成绩评定记录  \\
    \end{center}
    %\addcontentsline{toc}{chapter}{表一 毕业论文（设计）开题报告}

    \zihao{4}\songti
    \begin{longtable}{|p{0.9\textwidth}|}
        % 第一页出现的表头
        \hline
        \endfirsthead

        % 中间页出现的表头
        \hline
        %(前接)
        \endhead

        % 中间页出现的表脚
        %(后续) \\
        \hline
        \endfoot

        % 表格最后一页的表脚
        \hline
        \endlastfoot

        \hspace{\ccwd}指导教师评语：    \\
        \@gradingComment
        \vspace{\baselineskip}
        
        \hspace{\ccwd}成绩评定：  \\
        \vspace{\baselineskip}
        
        \hspace{\ccwd}指导教师签名:\hfill \quad 年\quad 月\quad 日 \\
        
        \hline
        
        \hspace{\ccwd}答辩小组或专业负责人意见：  \\
        \vspace{3\baselineskip}
        
        \hspace{\ccwd}成绩评定：  \\
        \vspace{\baselineskip}
        
        \hspace{\ccwd}签名:\hfill \quad 年\quad 月\quad 日  \\
        
        \hline
        \hspace{\ccwd}院系负责人意见：    \\
        \vspace{3\baselineskip}
        
        \hspace{\ccwd}成绩评定：  \\
        \vspace{\baselineskip}
        
        \hspace{\ccwd}\makebox[10cm]{签名（章）：\hfill}     \makebox[3cm]{\quad 年\quad 月\quad 日} \\
    \end{longtable}
\newclearpage
}

% 配置超链接。
% hyperref一般要求是导言区最后一个宏包，才能正常工作
% 若把该宏包提前，则会引起附录列表跳转到第一章的问题
% TODO: 重构宏包引入顺序以让代码语义聚集
\RequirePackage[hidelinks, hyperfootnotes=true]{hyperref}
\RequirePackage{footnotebackref}

\renewcommand{\@fnsymbol}[1]{
    \ifcase#1\or \text{①}\or \text{②}\or \text{③}\or    \text{④}\or \text{⑤}\or \text{⑥}\or \text{⑦}\or \text{⑧} \or \text{⑨} \or \text{⑩}
    \else
        \@ctrerr
    \fi
}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
