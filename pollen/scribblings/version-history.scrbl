#lang scribble/manual
@(require pollen/private/version
(for-label pollen/cache pollen/core pollen/template pollen/decode pollen/unstable/typography pollen/setup pollen/template/html))

@title{Version notes (@|pollen:version|)}

@section{What the version number means}

Consistent with Racket's @seclink["Package_Concepts" #:doc '(lib "pkg/scribblings/pkg.scrbl")]{version-numbering system}, the first digit reflects major updates to Pollen that break backward compatibility. The second digit reflects feature updates that don't affect existing features.

Inconsistent with this system, Pollen's version also appends a build number, which is the age of the software in days and seconds. (The official version reported in Pollen's @filepath{info.rkt} is just the major + minor digits.)

@section{Source code}

Pollen's source code is @link["http://github.com/mbutterick/pollen"]{available from this Git repo}. The @tt{MASTER} branch of the repo will always contain the most recent stable version. 

Racket's @link["http://pkg.racket-lang.org"]{package catalog} relies on this branch, so if you get your updates with @tt{raco pkg update pollen}, you'll get the most recent updates from this branch. 

I will add Git tags to commits where the major or minor version changed, so if you need to rebuild an earlier version, you can.

@section{Development policy}

Beyond keeping the commit history available, I make no promise to maintain the public interface in its current state. I will avoid unnecessary upheaval, of course. But my goal is to make the system more capable and stable, not to permanently burden it with my current level of ignorance.

@section{Changelog}

@subsection{Version 1.0} 

@bold{New features}

@racketmodname[pollen/cache]: @racket[cached-doc] and @racket[cached-metas] are the preferred way to retrieve data from a Pollen source file.

The @racketmodname[pollen/core] module has been added, the new home for functions that once lived in @racketmodname[pollen/template]. Also new splicing tag @racket[\@] and @racket[when/splice] macro.

@racketmodname[pollen/setup] replaces @racketmodname[pollen/world]. @racketmodname[pollen/setup] values can be overridden with a @racket[setup] submodule. Parameter names are no longer prefixed.

@bold{Backward incompatibilities}

@racketmodname[pollen/cache]: @racket[cached-require] is deprecated. Use @racket[cached-doc] or @racket[cached-metas].

@racketmodname[pollen/template]: functions like @racket[get-doc], @racket[get-metas], and the @racket[select] functions have been moved to @racketmodname[pollen/core]. @racket[when/block] is deprecated in favor of @racket[when/splice].

@racketmodname[pollen/template]: @racket[detect-paragraphs] and @racket[detect-linebreaks] have been renamed @racket[decode-paragraphs] and @racket[decode-linebreaks]. Typography functions like @racket[smart-quotes] and @racket[smart-dashes] have been moved to @racketmodname[pollen/unstable/typography]. @racket[register-block-tags] is gone — override @racket[default-block-tags] instead.

@racketmodname[pollen/file]: refined to a more carefully curated set of functions.

@racketmodname[pollen/template]: Pollen now supports any output formats, so this module has been broken into format-specific versions. For now, the only submodule is @racketmodname[pollen/template/html], the home of @racket[->html].

@racketmodname[pollen/world]: superseded by @racketmodname[pollen/setup] (see above). The @racket[config] submodule in a @filepath{pollen.rkt} will no longer work.

