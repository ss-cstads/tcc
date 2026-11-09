%% texifsap.cls
%% Obra derivada da classe texufpel (Copyright 2026 Marilton Sanchotene de
%% Aguiar, https://github.com/notcc/texufpel), distribuida sob a LaTeX
%% Project Public License (LPPL) 1.3c -- veja LICENSE.md.
%% Esta versao foi modificada para o IFSul - Campus Sapucaia do Sul: a
%% formatacao segue as normas ABNT (NBR 14724, 6023, 6024, 6027, 6028 e
%% 10520) e o Regulamento do TCC do curso, e nao o Manual de normas UFPel.

%==============================================================================
% Identificação
%==============================================================================
\def\currversion{09/11/2026}

\typeout{^^J^^J
--------------------------------------------------^^J
CLASSE texifsap^^J
Formatação de Documentos LaTeX do CSTADS do IFSul - câmpus Sapucaia do Sul^^J
--------------------------------------------------^^J
Desenvolvida a partir da Classe textufpel^^J
--------------------------------------------------^^J
Versão: \currversion^^J
--------------------------------------------------^^J^^J}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texifsap}[\currversion]

%==============================================================================
% Declaração de opções
%==============================================================================

% \newcommand{\bibliotecario}[1]{\gdef\@nomebibliotecario{#1}}
% \newcommand{\cipdata}[2]{\gdef\@codigocip{#1}\gdef\@codigocdd{#2}}

\newcommand{\universidade}[1]{\gdef\@universidade{#1}}
\newcommand{\universidadeeng}[1]{\gdef\@universidadeeng{#1}}
\universidade{Instituto Federal Sul-rio-grandense}
\universidadeeng{Sul-rio-grandense Federal Institute}

% O argumento opcional (artigo) e' aceito por compatibilidade com o texufpel:
% \unidade[a]{...} ou \unidade{...}; o texto do TCC do IFSul nao o utiliza.
\newcommand{\unidade}[2][o]{\gdef\@unidade{#2}}
\newcommand{\programa}[1]{\gdef\@programa{#1}}
\newcommand{\curso}[1]{\gdef\@curso{#1}}
\newcommand{\nomecurso}[1]{\gdef\@nomecurso{#1}}
% versao do nome do curso exclusiva para a capa, permitindo quebra de
% linha manual com \\ (opcional; se ausente, a capa usa \nomecurso)
\newcommand{\nomecursocapa}[1]{\gdef\@nomecursocapa{#1}}
\newcommand{\titulocurso}[1]{\gdef\@titulocurso{#1}}

\newcommand{\unidadeeng}[1]{\gdef\@unidadeeng{#1}}
\newcommand{\programaeng}[1]{\gdef\@programaeng{#1}}
\newcommand{\cursoeng}[1]{\gdef\@cursoeng{#1}}
\newcommand{\nomecursoeng}[1]{\gdef\@nomecursoeng{#1}}
\newcommand{\titulocursoeng}[1]{\gdef\@titulocursoeng{#1}}
% dados em ingles; sem a versao em ingles, usa a versao em portugues
\newcommand{\ei@titulocursoeng}{\@ifundefined{@titulocursoeng}{\@titulocurso}{\@titulocursoeng}}
\newcommand{\ei@nomecursoeng}{\@ifundefined{@nomecursoeng}{\@nomecurso}{\@nomecursoeng}}

\newcommand{\documento}[1]{\gdef\@documento{#1}}
\newcommand{\tipodocumento}[1]{\gdef\@tipodocumento{#1}}
\newcommand{\descricaodocumento}[1]{\gdef\@descricaodocumento{#1}}
\newcommand{\descricaoaprovacao}[1]{\gdef\@descricaoaprovacao{#1}}
% versoes em ingles, usadas pela opcao english na folha de rosto e na folha
% de aprovacao
\newcommand{\documentoeng}[1]{\gdef\@documentoeng{#1}}
\newcommand{\descricaodocumentoeng}[1]{\gdef\@descricaodocumentoeng{#1}}
\newcommand{\descricaoaprovacaoeng}[1]{\gdef\@descricaoaprovacaoeng{#1}}

\DeclareOption{tcc}{
\documento{Trabalho de Conclus\~ao de Curso}
\tipodocumento{\tccname\ (\cursoname) -- \unidadename}
\descricaodocumento{Trabalho de Conclus{\~a}o de Curso apresentado, como requisito parcial à obten{\c{c}}{\~a}o do t\'itulo de \@titulocurso, do Curso {\@nomecurso} do Instituto Federal Sul-rio-grandense - C{\^a}mpus Sapucaia do Sul.}
\descricaoaprovacao{Trabalho de Conclus{\~a}o de Curso aprovado, como requisito parcial à obten{\c{c}}{\~a}o do grau de \@titulocurso, do Curso {\@nomecurso} do Instituto Federal Sul-rio-grandense - C{\^a}mpus Sapucaia do Sul.}
\documentoeng{Undergraduate Thesis}
\descricaodocumentoeng{Undergraduate Thesis presented in partial fulfillment of the requirements for the degree of \ei@titulocursoeng, \ei@nomecursoeng\ Program, Sul-rio-grandense Federal Institute -- Sapucaia do Sul Campus.}
\descricaoaprovacaoeng{Undergraduate Thesis approved in partial fulfillment of the requirements for the degree of \ei@titulocursoeng, \ei@nomecursoeng\ Program, Sul-rio-grandense Federal Institute -- Sapucaia do Sul Campus.}
}

\newcommand{\capa}[1]{\gdef\@capa{#1}}
\DeclareOption{capa}{\capa{1}}

\newcommand{\nocipinfo}[1]{\gdef\@nocipinfo{#1}}
\DeclareOption{nocipinfo}{\nocipinfo{1}}

\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\relax

%==============================================================================
% Herança da classe `report' e inclusão de pacotes e arquivos necessários
%==============================================================================
\LoadClass[12pt,a4paper,oneside]{report}

\RequirePackage[english,brazilian]{babel}
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{natbib}
\RequirePackage{chngcntr}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{changepage}
\RequirePackage{etoolbox}
\RequirePackage{pdfpages}
\RequirePackage[T1]{fontenc}
% NBR 14724: citacoes longas, notas, paginacao, legendas e fontes das
% ilustracoes e tabelas em tamanho "menor e uniforme" -- todos em 10 pt
% (\footnotesize, o mesmo tamanho das notas de rodape)
\RequirePackage[singlelinecheck=off, skip=2pt, font=footnotesize, justification=justified, format=plain, labelsep=endash]{caption}

\DeclareCaptionListFormat{figuracf}{\figurename\ #1#2}
\DeclareCaptionListFormat{tabelacf}{\tablename\ #1#2}
% NBR 14724: a identificacao de ilustracoes e tabelas aparece na parte
% superior (position=top ajusta o espaco entre a legenda e o conteudo)
\captionsetup[figure]{position=top,listformat=figuracf}
\captionsetup[table]{position=top,listformat=tabelacf}

% conteudo e fonte (Fonte: ...) de figuras, tabelas e quadros em 10 pt;
% dentro deles, {\small ...} tambem vale 10 pt
\AtBeginEnvironment{figure}{\footnotesize\let\small\footnotesize}
\AtBeginEnvironment{table}{\footnotesize\let\small\footnotesize}

% textos em preto: links sem cor nem caixa; acentos nos marcadores do PDF
\hypersetup{hidelinks,unicode=true,linktoc=all}

%==============================================================================
% Ambiente flutuante para quadros, nos mesmos moldes das tabelas, com
% numeracao propria e Lista de Quadros (\listofquadros)
%==============================================================================
\newcounter{quadro}
\renewcommand\thequadro{\@arabic\c@quadro}
\def\fps@quadro{tbp}
\def\ftype@quadro{4}
\def\ext@quadro{loq}
\def\fnum@quadro{\quadroname~\thequadro}
\newenvironment{quadro}{\@float{quadro}}{\end@float}
\newenvironment{quadro*}{\@dblfloat{quadro}}{\end@dblfloat}
\newcommand\listofquadros{%
  \chapter*{\listquadroname}%
  \@mkboth{\MakeUppercase\listquadroname}{\MakeUppercase\listquadroname}%
  \@starttoc{loq}%
}
\DeclareCaptionListFormat{quadrocf}{\quadroname\ #1#2}
\captionsetup[quadro]{position=top,listformat=quadrocf}
\AtBeginEnvironment{quadro}{\footnotesize\let\small\footnotesize}

\geometry{top=3cm,right=2cm,left=3cm,bottom=2cm}

\definecolor{laranjaufpel}{rgb}{1,0.6,0}
\definecolor{verdeufpel}{rgb}{0.09,0.7,0.44}
\definecolor{azulufpel}{rgb}{0.07,0.49,0.72}
\definecolor{cinzaufpel}{rgb}{0.85,0.85,0.85}

%
% definições para textos em português
%
\@namedef{captionsbrazilian}{%
  \def\bibname{Refer{\^e}ncias}%
  \def\abstractname{Resumo}%
  \def\appendixname{Ap{\^e}ndice}%
  \def\contentsname{Sum{\'a}rio}%
  \def\listfigurename{Lista de Figuras}%
  \def\listtablename{Lista de Tabelas}%
  \def\listquadroname{Lista de Quadros}%
  \def\figurename{Figura}%
  \def\tablename{Tabela}%
  \def\quadroname{Quadro}%
  \def\advisorname{Orientador}%
  \def\coadvisorname{Coorientador}%
  \def\collaboratorname{Colaborador}%
  \def\advisorsname{Orientadores}%
  \def\coadvisorsname{Coorientadores}%
  \def\citeandname{e}%
  \def\listabbrvname{Lista de Abreviaturas e Siglas}%
  \def\listsymbolname{Lista de S{\'\i}mbolos}%
  \def\annexname{Anexo}%
  \def\keywordsname{Palavras-chave}%
  \def\tccname{Trabalho de Conclus\~ao de Curso}%
  \def\thesisname{Tese}%
  \def\eqname{Exame de Qualifica{\c{c}}{\~a}o}%
  \def\doctoratein{Doutorado em}%
  \def\dissname{Disserta\c c\~ao}%
  \def\masterin{Mestrado em}%
  \def\universidadename{\@universidade}%
  \def\unidadename{\@unidade}%
  \def\programaname{\@programa}%
  \def\cursoname{\@curso}%
}

\@namedef{datebrazilian}{%
  \def\monthname{%
    \ifcase\month\or%
    janeiro\or fevereiro\or mar{\c{c}}o\or abril\or maio\or junho\or
    julho\or agosto\or setembro\or outubro\or novembro\or dezembro%
    \fi%
  }%
  \def\ei@date{\@publyear}%
  % \def\ei@date{\@publmonth\ de~\@publyear}%
}

%
% definições para textos em inglês
%
\@namedef{captionsenglish}{%
  \def\bibname{References}%
  \def\abstractname{Abstract}%
  \def\appendixname{Appendix}%
  \def\contentsname{Contents}%
  \def\listfigurename{List of Figures}%
  \def\listtablename{List of Tables}%
  \def\listquadroname{List of Boxes}%
  \def\figurename{Figure}%
  \def\tablename{Table}%
  \def\quadroname{Box}%
  \def\advisorname{Advisor}%
  \def\coadvisorname{Coadvisor}%
  \def\collaboratorname{Collaborator}%
  \def\advisorsname{Advisors}%
  \def\coadvisorsname{Coadvisors}%
  \def\citeandname{and}%
  \def\listabbrvname{List of Abbreviations and Acronyms}%
  \def\listsymbolname{List of Symbols}%
  \def\annexname{Annex}%
  \def\keywordsname{Keywords}%
  \def\tccname{Undergraduate Thesis}%
  \def\eqname{Qualification Exam}%
  \def\thesisname{Thesis}%
  \def\doctoratein{Doctorate in}%
  \def\dissname{Dissertation}%
  \def\masterin{Masters in}%
  \def\universidadename{\@universidadeeng}%
  \def\unidadename{\@ifundefined{@unidadeeng}{\@unidade}{\@unidadeeng}}%
  \def\programaname{\@ifundefined{@programaeng}{\@programa}{\@programaeng}}%
  \def\cursoname{\@ifundefined{@cursoeng}{\@curso}{\@cursoeng}}%
}

\@namedef{dateenglish}{%
  \def\monthname{%
    \ifcase\month\or%
    January\or February\or March\or April\or May\or June\or July\or
    August\or September\or October\or November\or December%
    \fi%
  }%
  \def\ei@date{\@publyear}%
  % \def\ei@date{\@publmonth~\@publyear}%
}

% Data da capa e da folha de rosto (so' o ano). Definida tambem fora dos
% ganchos de idioma: pacotes como o datetime2 (carregado pelo pdfcomment)
% substituem \date<idioma> e o comando ficaria indefinido.
\def\ei@date{\@publyear}

\if@english%
\selectlanguage{english}%
\AtBeginDocument{\selectlanguage{english}}%
% folha de rosto e folha de aprovacao em ingles
\@ifundefined{@documentoeng}{}{\let\@documento\@documentoeng}%
\@ifundefined{@descricaodocumentoeng}{}{\let\@descricaodocumento\@descricaodocumentoeng}%
\@ifundefined{@descricaoaprovacaoeng}{}{\let\@descricaoaprovacao\@descricaoaprovacaoeng}%
\fi

%==============================================================================
% O uso de fonte Arial, 12 pt, é mandatório
%==============================================================================
\renewcommand*\familydefault{\sfdefault}%
\renewcommand{\rmdefault}{phv}%
\renewcommand{\sfdefault}{phv}

%==============================================================================
% Numeração das páginas
%==============================================================================
\def\ps@texufpel{%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \def\@oddhead{\hspace*{\fill}{\footnotesize\thepage}}%
  \def\@evenhead{\hspace*{\fill}{\footnotesize\thepage}}%
} 

\pagestyle{empty}%
\let\ps@plain\ps@empty

%==============================================================================
% Definição de autor(es), orientador e co-orientador
%==============================================================================
\newcounter{ei@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{ei@authorcount}{1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{ei@authorcount}\endcsname{#2 #1}
}

\newcounter{ei@advisorcount}
\DeclareRobustCommand{\advisor}[3][]{
        \addtocounter{ei@advisorcount}{1}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}\endcsname{#1~#3 #2}
}

\newcounter{ei@coadvisorcount}
\DeclareRobustCommand{\coadvisor}[3][]{
        \addtocounter{ei@coadvisorcount}{1}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}\endcsname{#1~#3 #2}
}

\newcounter{ei@collaboratorcount}
\DeclareRobustCommand{\collaborator}[3][]{
        \addtocounter{ei@collaboratorcount}{1}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}last\endcsname{#2}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}first\endcsname{#3}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}\endcsname{#1~#3 #2}
}


%==============================================================================
% Definição das palavras-chave (máx. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}

\newcounter{kwcountereng}
\newcommand{\keywordeng}[1]{
        \addtocounter{kwcountereng}{1}
        \expandafter\gdef\csname keyweng\alph{kwcountereng}\endcsname{#1}
}

\newcommand{\@cipkw}{%
       \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
       \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
       \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
       \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
       \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
       \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
       \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
       \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
       \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
       \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}

\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\expandafter \keywa}%
        \@ifundefined{keywb}{}{ \keywb}%
        \@ifundefined{keywc}{}{ \keywc}%
        \@ifundefined{keywd}{}{ \keywd}%
        \@ifundefined{keywe}{}{ \keywe}%
        \@ifundefined{keywf}{}{ \keywf}%
        \@ifundefined{keywg}{}{ \keywg}%
        \@ifundefined{keywh}{}{ \keywh}%
        \@ifundefined{keywi}{}{ \keywi}%
        \@ifundefined{keywj}{}{ \keywj}%
}


\newcommand{\@abstractkweng}{%
        \@ifundefined{keywenga}{}{\expandafter \keywenga}%
        \@ifundefined{keywengb}{}{ \keywengb}%
        \@ifundefined{keywengc}{}{ \keywengc}%
        \@ifundefined{keywengd}{}{ \keywengd}%
        \@ifundefined{keywenge}{}{ \keywenge}%
        \@ifundefined{keywengf}{}{ \keywengf}%
        \@ifundefined{keywengg}{}{ \keywengg}%
        \@ifundefined{keywengh}{}{ \keywengh}%
        \@ifundefined{keywengi}{}{ \keywengi}%
        \@ifundefined{keywengj}{}{ \keywengj}%
}


%==============================================================================
% Redefinição da data (para ter mês e ano separados)
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}
}
\date{\monthname}{\number\year}

%==============================================================================
% Definição padrão da folha de rosto.
% Os dados específicos do tipo de trabalho (dissertação, tese, etc.) são
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def incluídos com a classe.
%==============================================================================

\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}

\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}

\location{Sapucaia do Sul}{RS}

% NBR 14724: a capa nao e' contada; a folha de rosto e' a folha 1.
% A capa recebe o rotulo ``capa'' para que o hyperref nao gere ancoras de
% pagina duplicadas.
\renewcommand{\maketitle}{%
  \@ifundefined{@capa}{}{%
    \begingroup
    \def\thepage{capa}%
    \begin{titlepage}
    \thecoverpage
    \end{titlepage}%
    \endgroup
  }%
  \begin{titlepage}
  \thetitlepage
  \end{titlepage}%
  \setcounter{page}{2}%
}

\newcommand{\thecoverpage}{%
  \onehalfspacing%
  \noindent%
      \centering%
      \vskip 1cm%
      \MakeUppercase{\@universidade}\\%
      \MakeUppercase{\@unidade}\\%
      \@ifundefined{@nomecursocapa}%
        {\@ifundefined{@nomecurso}{}{\MakeUppercase{Curso \@nomecurso}\\}}%
        {\MakeUppercase{Curso \@nomecursocapa}\\}%
      \vskip 1cm%
      %\includegraphics[width=3cm]{imagens/ifsul.pdf}
      %\vskip 1cm%
      %\textbf{\@documento\\}%
      \vskip 1cm%
  \vskip 3cm%
  \noindent%
      \centering%
      \vskip .5cm%
      \MakeUppercase{\textbf{\@title}}%
      \vskip .5cm%
  \vskip 3cm%
  \noindent%
      \centering%
      \vskip .5cm%
      \@authora\\
      \@ifundefined{@authorb}{}{\@authorb\\}%
      \@ifundefined{@authorc}{}{\@authorc\\}%
      \@ifundefined{@authord}{}{\@authord\\}%
      \vskip .5cm%
  \vfill%
  \noindent%
      \centering%
      \vskip .1cm%
      \@city\\\ei@date%
      \vskip .1cm%
}

\newcommand{\thetitlepage}{%
  \noindent%
    \centering%
    {\@authora}\\
    \@ifundefined{@authorb}{}{{\@authorb}\\}%
    \@ifundefined{@authorc}{}{{\@authorc}\\}%
    \@ifundefined{@authord}{}{{\@authord}\\}%
    \vskip 5cm%
    {\MakeUppercase{\textbf{\@title}}}%
  \vskip 8cm%
        \singlespacing%
  % \sloppy: a caixa tem so' 9 cm; sem ele, palavras longas como
  % "Desenvolvimento" podem passar da margem direita
  \begin{adjustwidth}{7cm}{0cm}
        \sloppy\@descricaodocumento%
 %     	\end{hyphenrules}%
          \vskip .5cm% 
  \@ifundefined{@advisora}{}{%
        \@ifundefined{@advisora}{}{\advisorname: }{\@advisora\\}
        \@ifundefined{@coadvisora}{}{\coadvisorname: }{\@coadvisora\\}

        \end{adjustwidth}
    \vfill%
  }%
       \centering%
      \vskip .1cm%
      \@city\\\ei@date%
      \vskip .1cm%
}

%==============================================================================
% Ajuste do sumário (nada indentado) 
%==============================================================================
\newlength{\ei@chapnumindent}\setlength{\ei@chapnumindent}{1.8em}

\renewcommand*{\l@chapter}[2]{
        \addpenalty{-\@highpenalty}
        \vskip -1ex \@plus\p@
        \setlength\@tempdima{1.5em}
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode\bfseries\sffamily
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        \@dottedtocline{0}{0em}{\ei@chapnumindent}{#1}{#2}
        \penalty\@highpenalty
        \endgroup
}
\renewcommand*{\l@section}[2]
              {\@dottedtocline{1}{0em}{2.8em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{0em}{3.7em}}
\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        % sumario em espaco simples, como no guia exemplo-tcc.docx
        {\singlespacing\@starttoc{toc}}\@aftertoctrue%
}

%==============================================================================
% Definição das listas de abreviaturas e siglas e de símbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
  \chapter*{\listabbrvname}
  \begin{list}{\textbf{??}}{%
      \settowidth{\labelwidth}{#1}%
      \setlength{\labelsep}{1em}%
      \setlength{\itemindent}{0mm}%
      \setlength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\rightmargin}{0mm}%
      \setlength{\itemsep}{.1\baselineskip}%
      \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}%
    }
  }{
  \end{list}
} 

\newenvironment{listofsymbols}[1]{
  \chapter*{\listsymbolname}
  \begin{list}{\textbf{??}}{%
      \settowidth{\labelwidth}{#1}%
      \setlength{\labelsep}{1em}%
      \setlength{\itemindent}{0mm}%
      \setlength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\rightmargin}{0mm}%
      \setlength{\itemsep}{.1\baselineskip}%
      \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}%
    }
  }{
  \end{list}
}

%==============================================================================
% Resumo (abstract) e Abstract (englishabstract)
%==============================================================================
% NBR 6028:2021: resumo em paragrafo unico, sem recuo; palavras-chave logo
% abaixo do resumo, separadas do texto por uma linha em branco
\renewenvironment{abstract}{%
  \chapter*{\abstractname}
  \everypar{{\setbox\z@\lastbox}\everypar{}}% sem recuo (o indentfirst anula \@afterindentfalse)
%  \@ifundefined{@nocipinfo}{
%  \noindent{\MakeUppercase{\@authoralast},
%    \@authorafirst. \textbf{\@title}. \advisorname: \@advisorafirst\ \@advisoralast. \@publyear. \pageref{LastPage}~f. \@tipodocumento,
%    \universidadename, \@city, \@publyear.}\\~\\}{}
}{%
  \par\vspace{\baselineskip}%
  \noindent\keywordsname: \@abstractkw
}

\newenvironment{englishabstract}[1]{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  %\gdef\@englishkeywords{#2}%
  \gdef\@englishtitle{{#1}}%
  \iflanguage{english}{
    \begin{otherlanguage}{brazilian}
    }{
      \begin{otherlanguage}{english}
      }

      \chapter*{\abstractname}
      \everypar{{\setbox\z@\lastbox}\everypar{}}%
  %    \noindent{\MakeUppercase{\@authoralast},
  %      \@authorafirst. \textbf{\@englishtitle}. \advisorname: \@advisorafirst\ \@advisoralast. \@publyear. \pageref{LastPage}~f. %\@tipodocumento,
   %     \universidadename, \@city, \@publyear.}\\~\\
    }{
      \par\vspace{\baselineskip}%
      \noindent\keywordsname: \@abstractkweng
    \end{otherlanguage}
}

%==============================================================================
% Formatação dos capítulos.
% Os comandos \@chapter e \@schapter são redefinidos para que a
% numeração de páginas seja correta (deve aparecer somente a partir do
% primeiro capítulo do texto, mas não nas páginas iniciais de
% capítulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatação dos títulos propriamente ditos.
%==============================================================================
\newcommand{\ei@chapterfont}{\@setfontsize\Large{16}{20}}
\def\@chapapp{}

\def\@chapter[#1]#2{%
	\onehalfspacing
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \pagestyle{texufpel}\let\ps@plain\ps@texufpel%
  \@makechapterhead{#2}\@afterheading%
}

% NBR 14724: o titulo da secao primaria inicia na parte superior da mancha
% grafica, separado do texto que o sucede por um espaco de 1,5 entre linhas.
% O separador entre indicativo e titulo e' um espaco; em apendices/anexos,
% um travessao ("APENDICE A -- Titulo")
\newcommand{\ei@chapsep}{\hspace{1em}}
% NBR 14724: a numeracao figura a partir da primeira folha da parte
% textual, incluindo a pagina de abertura de cada capitulo (as paginas
% pre-textuais permanecem sem numero porque o estilo global so' muda
% para "texufpel" no primeiro \chapter da parte textual)
\def\@makechapterhead#1{%
  \reset@font\noindent{\ei@chapterfont\sffamily\textbf{\@chapapp\thechapter\ei@chapsep{#1}}\par}%
  \addvspace{21pt}%
}

\def\@schapter#1{%
  \if@aftertoc\phantomsection\addcontentsline{toc}{chapter}{#1}\fi%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makeschapterhead{#1}\@afterheading%
}

\def\@makeschapterhead#1{%
  \reset@font\centerline{\ei@chapterfont\sffamily\textbf{{#1}}}%
  \addvspace{21pt}%
}

% o contador ei@apxset garante ancoras unicas no hyperref (sem ele, o
% Apendice A, o Anexo A e o Capitulo 1 geram a mesma ancora chapter.1)
\newcounter{ei@apxset}
\renewcommand{\appendix}[1][\appendixname]{%
  \setcounter{chapter}{0}%
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \stepcounter{ei@apxset}%
  \xdef\theHchapter{apx\arabic{ei@apxset}.\noexpand\Alph{chapter}}%
  \setcounter{tocdepth}{0}%
  \@captionlistingfalse%
  \gdef\ei@chapsep{ -- }%
  \gdef\@chapapp{\MakeUppercase{#1}\space}%
  \addtocontents{toc}{%
    \protect \settowidth{\ei@chapnumindent}{{\sffamily\textbf{\@chapapp}}}%
    \addtolength{\ei@chapnumindent}{1.8em}%
  }%
}


\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formatação das seções
%==============================================================================
\setcounter{secnumdepth}{4} 

\renewcommand{\section}{%
  \@startsection{section}{1}{0pt}{18pt}{9pt}{\reset@font\large\bfseries}
} 

\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{0pt}{12pt}{6pt}{\reset@font\bfseries}
} 

\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\reset@font\itshape}
} 

\renewcommand{\paragraph}{%
  \@startsection{paragraph}{4}{0pt}{12pt}{6pt}{\reset@font} 
}

\renewcommand{\subparagraph}{%
  \@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}

%==============================================================================
% Formatação das legendas
%==============================================================================
\renewcommand{\thefigure}{\@arabic\c@figure}
\renewcommand{\thetable}{\@arabic\c@table}

\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{table}{chapter}

%==============================================================================
% Redefinição do conteúdo das listas de figuras e tabelas
%==============================================================================
\newif\if@captionlisting\@captionlistingtrue

\long\def\@caption#1[#2]#3{%
  \par
  \if@captionlisting%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnum@#1\endcsname}{\ignorespaces #2}}%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup%
}

\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}
\let\l@table\l@figure
\let\l@quadro\l@figure

%==============================================================================
% Redefinição do formato de citações longas
%==============================================================================
% NBR 10520:2023 e NBR 14724: recuo de 4 cm, tamanho menor que o do texto
% (10 pt, uniforme com notas e legendas), espaco simples e sem aspas
\renewenvironment{quote}{%
  \par\footnotesize\singlespacing%
  \begin{list}{}{\setlength{\leftmargin}{40mm}\setlength{\rightmargin}{0pt}%
    \setlength{\topsep}{12pt}\setlength{\parsep}{0pt}\item\relax}
  }{%
  \end{list}
}


%==============================================================================
% Ajuste do formato das citações e referências
%==============================================================================
\setlength{\bibhang}{0pt}
\let\cite\citep

% Separador dos sobrenomes na chamada (NBR 10520:2023): entre parenteses,
% ponto e virgula -- (Sousa; Lima, 2022); com os nomes na frase, virgula e
% "e" antes do ultimo -- Luz, Cardoso e Carvalho (2023); com a opcao
% english, "and". O abnt.bst escreve \citesep e \citelastsep entre os
% sobrenomes; o natbib marca as chamadas entre parenteses com \ifNAT@swa.
\newif\ifei@citeparen
\DeclareRobustCommand{\citesep}{\ifei@citeparen;\space\else\ifNAT@swa;\space\else,\space\fi\fi}
\DeclareRobustCommand{\citelastsep}{\ifei@citeparen;\space\else\ifNAT@swa;\space\else\space\citeandname\space\fi\fi}
% URLs das referencias na mesma fonte do texto (e com quebra de linha)
\urlstyle{same}

% NBR 6023: referencias em espaco simples, alinhadas somente a' margem
% esquerda e separadas entre si por uma linha em branco
\let\ei@thebibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \ei@thebibliography{#1}%
  \singlespacing\raggedright%
  \setlength{\itemsep}{\baselineskip}%
}

%==============================================================================
% Referencias locais em apendices e anexos (NBR 14724:2024): fontes citadas
% exclusivamente em apendice/anexo devem ser referenciadas no proprio
% apendice/anexo. Envolva o conteudo do apendice no ambiente
% referenciasapendice: as citacoes (\cite, \citet) funcionam normalmente e a
% lista de referencias correspondente e' emitida ao final do proprio ambiente,
% sem essas obras irem para a lista de Referencias principal.
%==============================================================================
\RequirePackage{bibunits}

% guarda o estilo e o arquivo .bib usados no documento para que os
% apendices os reutilizem automaticamente
\let\ei@bibliographystyle\bibliographystyle
\renewcommand{\bibliographystyle}[1]{%
  \defaultbibliographystyle{#1}\ei@bibliographystyle{#1}%
}
\let\ei@bibliography\bibliography
\renewcommand{\bibliography}[1]{%
  \defaultbibliography{#1}\ei@bibliography{#1}%
}

\newenvironment{referenciasapendice}{%
  \bibunit%
  % titulo das referencias locais como secao, na mesma pagina do apendice
  \renewcommand{\bibsection}{\section*{\bibname}}%
}{%
  \putbib%
  \endbibunit%
}

%==============================================================================
% Citacao de citacao (apud), NBR 10520:2023. Na lista de referencias entra
% SOMENTE a obra consultada; por isso o autor e o ano da obra original sao
% escritos a' mao, e so' a obra consultada e' indicada pela chave do .bib:
%   \apud{Moore}{1979}{Cormen}          -> Moore (1979 apud Cormen et al., 1990)
%   \apud[p.~45]{Moore}{1979}{Cormen}   -> Moore (1979 apud Cormen et al., 1990, p. 45)
%   \apudp{Moore}{1979}{Cormen}         -> (Moore, 1979 apud Cormen et al., 1990)
%==============================================================================
\newcommand{\apud}[4][]{#2 (#3 apud {\ei@citeparentrue\citeauthor{#4}}, \citeyear{#4}\if\relax\detokenize{#1}\relax\else, #1\fi)}
\newcommand{\apudp}[4][]{(#2, #3 apud {\ei@citeparentrue\citeauthor{#4}}, \citeyear{#4}\if\relax\detokenize{#1}\relax\else, #1\fi)}

% \renewcommand{\NAT@nmfmt}[1]{%
%   \ifNAT@swa\expandafter\MakeUppercase\else\expandafter\@firstofone\fi{{\NAT@up #1}}%
% }

%apendices
% NBR 14724: nao ha pagina divisoria "Apendices" -- cada apendice inicia
% direto com sua identificacao (APENDICE A -- Titulo), em pagina que
% continua contada e numerada
\newcommand{\apendices}{
  \clearpage
  \appendix
  \titleformat{\chapter}{\centering\normalfont}{\chaptertitlename\ \thechapter\ --\ }{0em}{}
}

%anexos
\newcommand{\anexos}{
  \clearpage
  \annex
  \titleformat{\chapter}{\centering\normalfont}{\chaptertitlename\ \thechapter\ --\ }{0em}{}
}

%ficha catalográfica
% NBR 14724:2024: a pagina da ficha (verso da folha de rosto) nao e'
% contada nem numerada, por isso o contador de paginas e' devolvido
% Uso: \fichacatalografica            (pagina provisoria, durante a escrita)
%      \fichacatalografica[ficha.pdf] (versao final: PDF emitido pela
%                                      Biblioteca; so' a 1a pagina)
% A pagina recebe o rotulo ``ficha'' para que o hyperref nao gere ancoras
% duplicadas.
\newcommand{\fichacatalografica}[1][]{%
	\clearpage
	\begingroup
	\def\thepage{ficha}%
	\if\relax\detokenize{#1}\relax
		\thispagestyle{empty}%
		\mbox{}
		\vfill
		\begin{center}
			\textbf{\if@english Insert the catalog card HERE\\When the work is finished, request it\\from the Library.\else Insira AQUI a ficha catalogr\'afica\\Quando finalizado o trabalho, deve ser\\solicitada à Biblioteca.\fi}
		\end{center}
		\vfill
		\clearpage
	\else
		\includepdf[pages=1]{#1}%
	\fi
	\endgroup
	\addtocounter{page}{-1}%
}
% forma antiga, mantida por compatibilidade: \fichacatalograficapdf{ficha.pdf}
\newcommand{\fichacatalograficapdf}[1]{\fichacatalografica[#1]}

% Referencia do trabalho (NBR 6023), usada na errata:
%   SOBRENOME, Nome. Titulo. Orientador: Nome. Ano. N f. Tipo (Curso) --
%   Unidade, Instituicao, Cidade, Ano.
\newcommand{\ei@nomes}[1]{%
  \csname @#1afirst\endcsname\ \csname @#1alast\endcsname
  \@ifundefined{@#1b}{}{; \csname @#1bfirst\endcsname\ \csname @#1blast\endcsname}%
  \@ifundefined{@#1c}{}{; \csname @#1cfirst\endcsname\ \csname @#1clast\endcsname}%
  \@ifundefined{@#1d}{}{; \csname @#1dfirst\endcsname\ \csname @#1dlast\endcsname}}
\newcommand{\ei@referencia}[1]{%
  {\singlespacing\raggedright\noindent\MakeUppercase{\@authoralast},
    \@authorafirst\@ifundefined{@authorb}{}{; \MakeUppercase{\@authorblast}, \@authorbfirst}. \textbf{#1}.
    \@ifundefined{@advisora}{}{\@ifundefined{@advisorb}{\advisorname}{\advisorsname}: \ei@nomes{advisor}. }%
    \@ifundefined{@coadvisora}{}{\@ifundefined{@coadvisorb}{\coadvisorname}{\coadvisorsname}: \ei@nomes{coadvisor}. }%
    \@publyear. \pageref{LastPage}~f. \@tipodocumento,
    \universidadename, \@city, \@publyear.\par}\vspace{\baselineskip}}

% Errata (NBR 14724, opcional): logo apos a folha de rosto, com a referencia
% do trabalho e o texto da errata. Uso:
%   \begin{errata}
%   16 & 10 & auto-clavado & autoclavado \\
%   \end{errata}
\newenvironment{errata}{%
  \chapter*{Errata}
  \ei@referencia{\@title}%
  \begin{center}
  \begin{tabular}{c c p{5.4cm} p{5.4cm}}
  \hline
  \textbf{Folha} & \textbf{Linha} & \textbf{Onde se l\^e} & \textbf{Leia-se} \\
  \hline
}{%
  \hline
  \end{tabular}
  \end{center}
}

%agradecimentos
\newenvironment{agradecimentos}{
	\chapter*{Agradecimentos}
}{
}

%dedicatória
\newenvironment{dedicatoria}{
	\clearpage
  \onehalfspacing
	\mbox{}
	\vfill
  \begin{adjustwidth}{6cm}{0cm}
}{
	\end{adjustwidth}
	\vfill
}

%epígrafe
\newenvironment{epigrafe}{
  \clearpage
  \thispagestyle{empty} % Remove page numbering
  \vspace*{\fill}       % Push content to the bottom of the page
  \onehalfspacing       % Line spacing 1.5
  \itshape              % Italic text
  \fontsize{10pt}{12pt}\selectfont % Font Arial, size 10
  \noindent
  \hspace*{6cm}         % Indent 6 cm
  \begin{minipage}{9cm} % Maximum width of text, adjusted for indent
}{
  \end{minipage}
  \vspace*{\fill}       % Additional spacing at the bottom if necessary
}

%nominata da banca
\newenvironment{aprovacao}[1]{
	\clearpage
	\onehalfspacing
	\begin{center}
		\noindent{\@authora}\\
        \@ifundefined{@authorb}{}{\noindent{\@authorb}\\}%
		\vskip 2cm
		\noindent\textbf{\@title}\\
		\vskip 2cm
		\begin{adjustwidth}{7cm}{0cm}
        \singlespacing\sloppy
		\begin{hyphenrules}{nohyphenation}
			\@descricaoaprovacao
		\end{hyphenrules}
			\end{adjustwidth}
	
	\vskip 2cm
	\noindent\textbf{Aprovada em: }{#1}\\
	\mbox{}
	\vfill
	
		\textbf{Banca Examinadora: }\\
}{
	\end{center}
	\vfill
}

%==============================================================================
% Ajustes gerais
%==============================================================================
% NBR 14724: texto com entrelinha de 1,5 (os elementos em espaco simples --
% citacoes longas, notas, referencias, legendas e natureza do trabalho --
% ajustam o espacamento nos proprios ambientes)
\onehalfspacing

% NBR 14724: notas de rodape separadas do texto por um filete de 5 cm a
% partir da margem esquerda e alinhadas, a partir da segunda linha, abaixo
% da primeira letra da primeira palavra (destacando o expoente)
\renewcommand{\footnoterule}{\kern-3\p@\hrule\@width 5cm\kern 2.6\p@}
\renewcommand\@makefntext[1]{%
  \setbox\@tempboxa\hbox{\@makefnmark\space}%
  \hangindent\wd\@tempboxa\hangafter\@ne
  \noindent\box\@tempboxa#1}

% NBR 6024:2012: alineas (enumerate de 1o nivel) indicadas por letra
% minuscula seguida de parentese -- a), b), ..., z), aa), bb)... -- e
% subalineas (2o nivel) por travessao seguido de espaco. A pontuacao (ponto
% e virgula, dois-pontos, ponto final) e' escrita pelo autor.
\newcommand{\ei@alinea}[1]{%
  \ifnum\value{#1}>26
    \@alph{\numexpr\value{#1}-26\relax}\@alph{\numexpr\value{#1}-26\relax}%
  \else
    \@alph{\value{#1}}%
  \fi}
\renewcommand{\theenumi}{\ei@alinea{enumi}}
\renewcommand{\labelenumi}{\theenumi)}
\renewcommand{\theenumii}{\ei@alinea{enumii}}
\renewcommand{\labelenumii}{--}
\renewcommand{\p@enumii}{\theenumi)}

% pelo menos duas linhas de um paragrafo no fim e no inicio da pagina
\clubpenalty=10000
\@clubpenalty=10000
\widowpenalty=10000
