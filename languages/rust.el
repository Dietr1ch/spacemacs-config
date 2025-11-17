;; Rust

(add-hook 'rust-mode-hook
          (lambda ()

            ;; (envrc-reload)
            ;; (eglot)
            ;; (company-mode-on)
            (setq
             projectile-project-test-cmd        "cargo test  --all-targets --no-fail-fast"
             projectile-project-compilation-cmd "cargo build --all-targets --keep-going"
             projectile-project-install-cmd     "cargo build --all-targets --keep-going --release"
             )

            (setq prettify-symbols-alist '(
                                           ;; Ideas:
                                           ;; https://en.wikipedia.org/wiki/List_of_logic_symbols
                                           ;; https://en.wikipedia.org/wiki/Glossary_of_mathematical_symbols
                                           ;; https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode
                                           ;; https://en.wikipedia.org/wiki/APL_syntax_and_symbols
                                           ;; https://en.wiktionary.org/wiki/Appendix:Unicode/Miscellaneous_Mathematical_Symbols-A
                                           ;; https://www.compart.com/en/unicode/category/So (Unicode "Other Symbols")

                                           ;; Syntax
                                           ("mod" . ?🕮)  ;; BOOK
                                           ("use" . ?⇠)  ;; LEFTWARDS DASHED ARROW
                                           ("enum"   . ?🗅)  ;; EMPTY NOTE
                                           ("struct" . ?🗋)  ;; EMPTY DOCUMENT
                                           ("impl"   . ?🖹)  ;; DOCUMENT WITH TEXT
                                           ("type"  . ?≝)  ;; EQUAL TO BY DEFINITION (≣️ STRICTLY EQUIVALENT TO)
                                           ("const" . ?≝)  ;; EQUAL TO BY DEFINITION (≣️ STRICTLY EQUIVALENT TO)

                                           ("unsafe" . ?⚠)  ;; WARNING SIGN
                                           ("mut"    . ?☢)  ;; RADIOACTIVE SIGN

                                           ;; ("let mut"  . ?⩦)  ;; EQUALS SIGN WITH DOT BELOW
                                           ("let"      . ?≔)  ;; COLON EQUALS

                                           ("pub"      . ?𝓟)  ;; MATHEMATICAL BOLD SCRIPT CAPITAL P
                                           ("fn"       . ?𝓕)  ;; MATHEMATICAL BOLD SCRIPT CAPITAL F
                                           ("for"      . ?∀)  ;; FOR ALL
                                           ("if"       . ?？) ;; FULLWIDTH QUESTION MARK
                                           ("else"     . ?¿)  ;; INVERTED QUESTION MARK
                                           ("match"    . ?⎇)  ;; ALTERNATIVE KEY SYMBOL
                                           ("while"    . ?⟳)  ;; CLOCKWISE GAPPED CIRCLE ARROW
                                           ("loop"     . ?⥁)  ;; CLOCKWISE CLOSED CIRCLE ARROW
                                           ("in"       . ?∈)  ;; ELEMENT OF
                                           ("not in"   . ?∉)  ;; NOT AN ELEMENT OF
                                           ("continue" . ?↰)  ;; UPWARDS ARROW WITH TIP LEFTWARDS
                                           ;; ("return"   . ?⇙)  ;; SOUTH WEST DOUBLE ARROW
                                           ;; ("return"   . ?⏎)  ;; RETURN SYMBOL
                                           ("return"   . ?⟸)  ;; LONG LEFTWARDS DOUBLE ARROW
                                           ("yield"    . ?⤙)  ;; LEFTWARDS ARROW-TAIL

                                           ;; Async
                                           ("async"    . ?⏲)  ;; TIMER CLOCK
                                           ("await"    . ?⏰)  ;; ALARM CLOCK
                                           ("spawn"    . ?⇝)  ;; RIGHTWARDS SQUIGGLE ARROW
                                           ("select!" . ?🥇)  ;; WRAPPED PRESENT
                                           ("join!"   . ?🏁)  ;; CHEQUERED FLAG
                                           ;; ("select!" . ?⫲)  ;; PARALLEL WITH HORIZONTAL STROKE
                                           ;; ("join!"   . ?︙)  ;; PRESENTATION FORM FOR VERTICAL HORIZONTAL ELLIPSIS

                                           ;; ("  assert!"     . ?⊦)  ;; ASSERTION
                                           ;; ("  assert_eq!"  . ?🮗)  ;; HEAVY HORIZONTAL FILL
                                           ;; ("  assert_ok!"  . ?✔)  ;; HEAVY CHECK MARK
                                           ;; ("assert!"     . ?⊦)  ;; ASSERTION
                                           ;; ("assert_eq!"  . ?🮗)  ;; HEAVY HORIZONTAL FILL
                                           ;; ("assert_ok!"  . ?✔)  ;; HEAVY CHECK MARK

                                           ("  debug_assert!"     . ?⊦)  ;; ASSERTION
                                           ("  debug_assert_eq!"  . ?🮗)  ;; HEAVY HORIZONTAL FILL
                                           ("  debug_assert_ok!"  . ?✔)  ;; HEAVY CHECK MARK
                                           ("debug_assert!"     . ?⊦)  ;; ASSERTION
                                           ("debug_assert_eq!"  . ?🮗)  ;; HEAVY HORIZONTAL FILL
                                           ("debug_assert_ok!"  . ?✔)  ;; HEAVY CHECK MARK
                                           ("std::process::exit"   . ?†)  ;; DAGGER

                                           ("#[inline(always)]"     . ?☇)  ;; LIGHTNING
                                           ("#[inline(never)]"      . ?🐌)  ;; SNAIL
                                           ("#[cold]"               . ?⛇)  ;; BLACK SNOWMAN
                                           ("#[tailcall::tailcall]" . ?➿)  ;; DOUBLE CURLY LOOP

                                           ("test"  . ?🧪)  ;; TEST TUBE
                                           ("#[test]"  . ?🔬)  ;; MICROSCOPE
                                           ("#[gtest]"  . ?⚗)  ;; ALEMBIC

                                           ;; googletest

                                           ;; ("verify_that!"  . ?□) ;; WHITE SQUARE

                                           ;; ("assert_eq!"  . ?⩮) ;; EQUALS WITH ASTERISK
                                           ("expect_eq!"  . ?≟) ;; QUESTIONED EQUAL TO
                                           ;; ("expect_false!"    . ?⊥)
                                           ;; ("expect_float_eq!" . ?≅)
                                           ;; ("expect_ge!"       . ?≥)
                                           ;; ("expect_gt!"       . ?>)
                                           ;; ("expect_le!"       . ?≤)
                                           ;; ("expect_lt!"       . ?<)
                                           ;; ("expect_ne!"       . ?≠)
                                           ;; ("expect_near!"     . ?⩰)
                                           ;; ("expect_pred!"     . ??)
                                           ("assert_that!"  . ?❕) ;; WHITE EXCLAMATION MARK ORNAMENT
                                           ("expect_that!"  . ?❔) ;; WHITE QUESTION MARK ORNAMENT
                                           ;; ("expect_true!"     . ?⊤)

                                           ;; Arrows (They have nice ligatures)
                                           ;; ("->"     . ?→)  ;; RIGHTWARDS ARROW
                                           ;; ("=>"     . ?⟹)  ;; LONG RIGHTWARDS DOUBLE ARROW

                                           ;; Logic
                                           ("&&"    . ?∧)  ;; LOGICAL AND
                                           ("||"    . ?∨)  ;; LOGICAL OR
                                           ("true"  . ?⟙)  ;; LARGE DOWN TACK
                                           ("false" . ?⟘)  ;; LARGE UP TACK
                                           ;; Comparisons (They have nice ligatures)
                                           ;; ("=="    . ?≡)  ;; IDENTICAL TO
                                           ;; ("!="    . ?≠)  ;; NOT EQUAL TO
                                           ;; ("/="    . ?≠)  ;; NOT EQUAL TO
                                           ;; ("<="    . ?≤)  ;; LESS-THAN OR EQUAL TO
                                           ;; (">="    . ?≥)  ;; GREATER-THAN OR EQUAL TO
                                           ;; Math
                                           (".add"   . ?∔)  ;; DOT PLUS
                                           (".sub"   . ?∸)  ;; DOT MINUS
                                           (".div"   . ?÷)  ;; DIVISION SIGN
                                           (".mul"   . ?⨰)  ;; MULTIPLICATION SIGN WITH DOT ABOVE

                                           ;; Printing
                                           ("print!"    . ?🖹) ;; DOCUMENT WITH TEXT
                                           ("println!"  . ?🖶)  ;; PRINTER ICON
                                           ("write!"    . ?✐)  ;; UPPER RIGHT PENCIL
                                           ("writeln!" . ?✎)  ;; LOWER RIGHT PENCIL
                                           ;; ("todo!"  . ?🎗)  ;; REMINDER RIBBON
                                           ("todo!"  . ?📝)  ;; MEMO

                                           ;; Logging
                                           ("log::trace!"  . ?ⓣ)  ;; CIRCLED LATIN LETTER t
                                           ("log::debug!"  . ?ⓓ)  ;; CIRCLED LATIN LETTER d
                                           ("log::info!"   . ?ⓘ)  ;; CIRCLED LATIN LETTER i
                                           ("log::warn!"   . ?ⓦ)  ;; CIRCLED LATIN LETTER w
                                           ("log::error!"  . ?ⓔ)  ;; CIRCLED LATIN LETTER e
                                           ("tracing::trace!"  . ?🅃)  ;; SQUARED LATIN CAPITAL LETTER T
                                           ("tracing::debug!"  . ?🄳)  ;; SQUARED LATIN CAPITAL LETTER D
                                           ("tracing::info!"   . ?🄸)  ;; SQUARED LATIN CAPITAL LETTER I
                                           ("tracing::warn!"   . ?🅆)  ;; SQUARED LATIN CAPITAL LETTER W
                                           ("tracing::error!"  . ?🄴)  ;; SQUARED LATIN CAPITAL LETTER E
                                           ;; ("tracing::trace!"  . ?Ⓣ)  ;; CIRCLED LATIN CAPITAL LETTER T
                                           ;; ("tracing::debug!"  . ?Ⓓ)  ;; CIRCLED LATIN CAPITAL LETTER D
                                           ;; ("tracing::info!"   . ?Ⓘ)  ;; CIRCLED LATIN CAPITAL LETTER I
                                           ;; ("tracing::warn!"   . ?Ⓦ)  ;; CIRCLED LATIN CAPITAL LETTER W
                                           ;; ("tracing::error!"  . ?Ⓔ)  ;; CIRCLED LATIN CAPITAL LETTER E
                                           ("panic!"       . ?🕱)  ;; BLACK SKULL AND CROSSBONES

                                           ;; Types
                                           ;; ("Box"     . ?📦)  ;; PACKAGE

                                           ;; Operations
                                           ;; Ideas https://en.wikipedia.org/wiki/APL_syntax_and_symbols

                                           ("Option"       . ?◐)  ;; CIRCLE WITH LEFT HALF BLACK
                                           ("Some"         . ?●)  ;; BLACK CIRCLE
                                           ("None"         . ?○)  ;; WHITE CIRCLE
                                           ("is_some"      . ?●)  ;; BLACK CIRCLE (?🪺 NEST WITH EGGS)
                                           ("is_empty"     . ?○)  ;; BLACK CIRCLE (?🪹 EMPTY NEST)
                                           (".ok_or"       . ?⁇)  ;; DOUBLE QUESTION MARK
                                           (".or_else"     . ?⁈)  ;; QUESTION EXCLAMATION MARK
                                           (".expect"      . ?⟥)  ;; WHITE SQUARE WITH RIGHTWARDS TICK (Modal logic's Will always be)
                                           (".xor"         . ?⊻)  ;; XOR

                                           ;; ("Result"  . ?☐)  ;; BALLOT BOX
                                           ;; ("Ok"  . ?☑)  ;; BALLOT BOX WITH CHECK
                                           ;; ("Err" . ?☒)  ;; BALLOT BOX WITH X
                                           ("Ok"  . ?✓)  ;; CHECK MARK
                                           ("Err" . ?❌)  ;; CROSS MARK
                                           ("Result"  . ?⬕)  ;; SQUARE WITH LOWER LEFT DIAGONAL HALF BLACK
                                           ("Ok(())"  . ?∎)  ;; END OF PROOF
                                           (".ok_or_else"  . ?⁈)  ;; QUESTION EXCLAMATION MARK
                                           ;; T ⇒ f(T)
                                           ("|_|"       . ?λ)  ;; GREEK SMALL LETTER LAMBDA
                                           (".map"      . ?⇒)  ;; RIGHTWARDS DOUBLE ARROW
                                           ;; Result<T,E> ⤃ Result<T, f(E)>
                                           (".map_err"  . ?⤃)  ;; RIGHTWARDS DOUBLE ARROW WITH VERTICAL STROKE

                                           ;; Initialization
                                           ("new"       . ?∅)  ;; EMPTY SET
                                           ("default"   . ?⦱)  ;; EMPTY SET WITH OVERBAR
                                           ("build"     . ?🔨)  ;; HAMMER
                                           ;; ("build"     . ?⬰)  ;; LEFT ARROW WITH SMALL CIRCLE

                                           ("clone"     . ?⯼)  ;; DOUBLED SYMBOL
                                           ("move"      . ?⇉)  ;; RIGHT PAIRED ARROWS
                                           ;; Conversion
                                           ("from" . ?⤺)    ;; TOP ARC ANTICLOCKWISE ARROW
                                           ("into" . ?⤼)  ;; TOP ARC CLOCKWISE ARROW WITH MINUS
                                           ;; Result
                                           (".get()"        . ?⁍)  ;; BLACK RIGHTWARDS BULLET
                                           ("unwrap"            . ?‼)  ;; DOUBLE EXCLAMATION MARK
                                           ("unwrap_or_else"    . ?⁈)  ;; QUESTION EXCLAMATION MARK
                                           ("unwrap_or"         . ?⁇)  ;; DOUBLE QUESTION MARK
                                           ("unwrap_or_default" . ?⁈)  ;; QUESTION EXCLAMATION MARK
                                           ;; Sockets
                                           ("recv" . ?↫)  ;; LEFTWARDS ARROW WITH LOOP
                                           ("send" . ?↬)  ;; RIGHTWARDS ARROW WITH LOOP
                                           ;; Collections
                                           (".len()"        . ?#)  ;; NUMBER SIGN
                                           (".union"        . ?∪)  ;; UNION
                                           (".intersection" . ?∩)  ;; INTERSECTION
                                           (".push"   . ?⧺)  ;; DOUBLE PLUS
                                           (".extend" . ?⧻)  ;; TRIPLE PLUS
                                           (".insert" . ?⟜) ;; LEFT MULTIMAP
                                           (".remove" . ?∖) ;; SET MINUS
                                           (".pop()"       . ?↠)  ;; RIGHT TWO HEADED ARROW
                                           (".pop_back()"  . ?⤠)  ;; RIGHTWARDS ARROW FROM BAR TO BLACK DIAMOND
                                           (".pop_front()" . ?⤟)  ;; LEFTWARDS ARROW FROM BAR TO BLACK DIAMOND
                                           (".push_back"  . ?⇤)  ;; LEFTWARDS ARROW TO BAR
                                           (".push_front" . ?⇥)  ;; RIGHTWARDS ARROW TO BAR
                                           ;; HashMap
                                           (".get"        . ?@)  ;; COMMERCIAL AT
                                           (".entry"      . ?⎆)  ;; ENTER SYMBOL
                                           (".or_insert"  . ?≟)  ;; QUESTIONED EQUAL TO
                                           (".or_default" . ?⁈)  ;; QUESTION EXCLAMATION MARK

                                           ;; Numbers  (https://doc.rust-lang.org/std/primitive.f64.html)
                                           (".add"     . ?∔)  ;; DOT PLUS
                                           (".sub"     . ?∸)  ;; DOT MINUS
                                           (".mul"     . ?⨰)  ;; MULTIPLICATION SIGN WITH DOT ABOVE
                                           (".div"     . ?÷)  ;; DIVISION SIGN
                                           (".max"     . ?⌈)  ;; LEFT CEILING
                                           (".min"     . ?⌊)  ;; LEFT FLOOR
                                           (".ceil()"  . ?⌉)  ;; RIGHT CEILING
                                           (".floor()" . ?⌋)  ;; RIGHT FLOOR
                                           (".round()" . ?♮)  ;; MUSIC NATURAL SIGN
                                           (".exp2"    . ?²)  ;; SUPERSCRIPT TWO
                                           (".exp3"    . ?³)  ;; SUPERSCRIPT THREE
                                           ("sqrt"     . ?√)  ;; SQUARE ROOT
                                           ("cbrt"     . ?∛)  ;; CUBE ROOT
                                           (".powi"    . ?⌤) ;; UP ARROWHEAD BETWEEN TWO HORIZONTAL BARS
                                           (".powf"    . ?⌃) ;; UP ARROWHEAD
                                           ("INFINITY" . ?∞)  ;; INFINITY

                                           ;; ("next" . ?∞)  ;; INFINITY
                                           ;; ("prev" . ?∞)  ;; INFINITY
                                           ;; ("send" . ?∞)  ;; INFINITY
                                           ;; ("recv" . ?∞)  ;; INFINITY
                                           ;; ("first" . ?⊢)  ;; RIGHT TACK
                                           ;; ("last"  . ?⊣)  ;; LEFT TACK

                                           ;; Fields (MATHEMATICAL DOUBLE-STRUCK CAPITAL)
                                           ("bool"   . ?𝔹)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL B
                                           ("String" . ?𝕊)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL S
                                           ;; ("to_string()" . ?𝕤)  ;; MATHEMATICAL DOUBLE-STRUCK SMALL S
                                           ;; ℤ: DOUBLE-STRUCK CAPITAL Z
                                           ;; ("i8"    . (#x2124 #x38))            ;; DOUBLE-STRUCK CAPITAL Z: ℤ8
                                           ;; ("i16"   . (#x2124 #x31 #x36))       ;; DOUBLE-STRUCK CAPITAL Z: ℤ16
                                           ;; ("i32"   . (#x2124 #x33 #x32))       ;; DOUBLE-STRUCK CAPITAL Z: ℤ32
                                           ("i32"   . ?ℤ)  ;; DOUBLE-STRUCK CAPITAL Z
                                           ;; ("i64"   . (#x2124 #x36 #x34))       ;; DOUBLE-STRUCK CAPITAL Z: ℤ64
                                           ;; ("i128"  . (#x2124 #x31 #x32 #x38))  ;; DOUBLE-STRUCK CAPITAL Z: ℤ128
                                           ;; ("isize" . (#x2124 #x73))            ;; DOUBLE-STRUCK CAPITAL Z: ℤs
                                           ;; ℕ: DOUBLE-STRUCK CAPITAL N
                                           ;; ("u8"    . (#x2115 #x38))            ;; DOUBLE-STRUCK CAPITAL N: ℕ8
                                           ;; ("u16"   . (#x2115 #x31 #x36))       ;; DOUBLE-STRUCK CAPITAL N: ℕ16
                                           ;; ("u32"   . (#x2115 #x33 #x32))       ;; DOUBLE-STRUCK CAPITAL N: ℕ32
                                           ("u32"   . ?ℕ)  ;; DOUBLE-STRUCK CAPITAL N
                                           ;; ("u64"   . (#x2115 #x36 #x34))       ;; DOUBLE-STRUCK CAPITAL N: ℕ64
                                           ;; ("u128"  . (#x2115 #x31 #x32 #x38))  ;; DOUBLE-STRUCK CAPITAL N: ℕ128
                                           ;; ("usize" . (#x2115 #x73))            ;; DOUBLE-STRUCK CAPITAL N: ℕs
                                           ;; ℝ: DOUBLE-STRUCK CAPITAL R
                                           ;; ("f8"   . (#x211d #x38))            ;; DOUBLE-STRUCK CAPITAL R: ℝ8
                                           ;; ("f16"  . (#x211d #x31 #x36))       ;; DOUBLE-STRUCK CAPITAL R: ℝ16
                                           ;; ("f32"  . (#x211d #x33 #x32))       ;; DOUBLE-STRUCK CAPITAL R: ℝ32
                                           ("f64"  . ?ℝ)  ;; DOUBLE-STRUCK CAPITAL R
                                           ;; ("f64"  . (#x211d #x36 #x34))       ;; DOUBLE-STRUCK CAPITAL R: ℝ64
                                           ;; ("f128" . (#x211d #x31 #x32 #x38))  ;; DOUBLE-STRUCK CAPITAL R: ℝ128
                                           ("Complex"  . ?ℂ)  ;; DOUBLE-STRUCK CAPITAL C

                                           ("HashSet" .   ?𝔖)  ;; MATHEMATICAL FRAKTUR CAPITAL S:
                                           ("HashMap" .   ?𝔇)  ;; MATHEMATICAL FRAKTUR CAPITAL D:
                                           ("Vec"     .   ?𝕍)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL V: 𝕍
                                           ;; ("vec!"     .  ?𝕍)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL V: 𝕍
                                           ))
            ))  ;; add-hook 'rust-mode-hook
