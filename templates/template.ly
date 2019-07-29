%-------------------------HEADER {{{
#(ly:set-option 'midi-extension "mid")
\version "2.18.2"
\header {
  tagline = ""  % removed
  title = ""
  subtitle = ""
  composer = ""
}
% \include "lilypond-book-preamble.ly"
%-------------------------}}}
%-------------------------PREAMBLE {{{
global = {
\key g \major
  \time 2/4
}

#(set-global-staff-size 17)
\paper {
  % between-system-space = 10\mm % does nothing?
  % between-system-padding = #1 % does nothing?
        %system-count = #4
  % ragged-bottom = ##t
  % ragged-last-bottom = ##t
  % bottom-margin=0\mm
  % top-margin=0\mm
  % paper-height=310\mm
}

%% сюда ставим все \repeat


%------------------------- }}}
%-------------------------I часть {{{

\parallelMusic #'(
voiceA 
voiceB 
voiceC
voiceD
) 
% rhMusic
% lhMusic

{
%=========================
 }

%------------------------- }}}
%-------------------------CONTEXT {{{
\layout { 
% ragged-right = ##f 
\context {
\RemoveEmptyStaffContext
}
%    \Score
%    defaultBarType = ""
}
%-------------------------}}} 
%-------------------------STAVES {{{

%%% 1–й score для pdf/png output
\score {
\new StaffGroup <<
  \new Staff 
  <<
      \global
    \with {instrumentName = #"Струнные "} 
    << 
      \relative c'' { \voiceA } \\ \relative c' { \voiceB } 
    >>
  >>
  \new Staff 
  <<
  \global
    \with {instrumentName = #"Фортепиано "} 
    \relative c' { \voiceC }
  >>
  \new Staff 
  <<
  \global
    \with {instrumentName = #"Электрогитара "} 
    \relative c {\clef bass  \voiceD }
  >>
%  \new PianoStaff <<
%    \new Staff \rhMusic
%    \new Staff \lhMusic
%    >>
>>
\layout { }
}

%%% 2–й score для midi output, 
%%% с \unfoldRepeats (чтобы \repeat работали в midi)
\score {
  \unfoldRepeats
\new StaffGroup <<
  \new Staff 
  <<
      \global
    \with {instrumentName = #"Струнные "} 
    << 
      \relative c'' { \voiceA } \\ \relative c' { \voiceB } 
    >>
  >>
  \new Staff 
  <<
  \global
    \with {instrumentName = #"Фортепиано "} 
    \relative c' { \voiceC }
  >>
  \new Staff 
  <<
  \global
    \with {instrumentName = #"Электрогитара "} 
    \relative c {\clef bass  \voiceD }
  >>
%  \new PianoStaff <<
%    \new Staff \rhMusic
%    \new Staff \lhMusic
%    >>
>>
\midi { }
}
%-------------------------}}}
