set margin to input_margin()
tell application "TextEdit"
	activate
	make new document
	set text of front document to my rtf_setting(margin)
	set tmp_path to (path to temporary items as text) & "rtf_margin_setting.scpt.rtf"
	set doc_name to "Margin settings" & my in_text(margin) & ".rtf"
	close front document saving yes saving in tmp_path
	open file (tmp_path)
	set name of front document to doc_name
end tell

on input_margin()
	set margin to false
	repeat until margin
		set my text item delimiters to {",", " "}
		
		"Set margins in inch {top right bottom left}
" & "
" & " 1          ..  all = 1
" & " 1 0.5      ..  ↑/↓ = 1, →/← = 0.5
" & " 1 0.5 5    ..    ↑ = 1, →/← = 0.5, ↓ = 5
" & " 1 0.5 5 3  ..    ↑ = 1,   → = 0.5, ↓ = 5, ← = 3

" & return & "Header & footer. (+1, +0.5, 1, 0.25, 0.25, 0.125) "
		
		display dialog result default answer "" buttons {"Cancel", "OK"} default button 2 with icon note
		set margin to result's text returned's text items
		
		set my text item delimiters to ""
		if margin's number = 1 then
			twip(margin's item 1, margin's item 1, margin's item 1, margin's item 1) & {margin}
		else if margin's number = 2 then
			twip(margin's item 1, margin's item 2, margin's item 1, margin's item 2) & {margin}
		else if margin's number = 3 then
			twip(margin's item 1, margin's item 2, margin's item 3, margin's item 2) & {margin}
		else if margin's number = 4 then
			twip(margin's item 1, margin's item 2, margin's item 3, margin's item 4) & {margin}
		else
			beep
			set margin to false
		end if
	end repeat
end input_margin

on rtf_setting(margin)
	set rtf1 to "{\\rtf1\\mac\\ansicpg10001\\cocoartf824\\cocoasubrtf470" & return
	set end_rtf1 to "}"
	set paperw to {"\\paperw", 12240} --8.5 inch--US Letter
	set paperh to {"\\paperh", 15840} --11 inch--US Letter
	set margt to {"\\margt", margin's item 1}
	set margr to {"\\margr", margin's item 2}
	set margb to {"\\margb", margin's item 3}
	set margl to {"\\margl", margin's item 4}
	set vieww to {"\\vieww", 999999}
	set viewh to {"\\viewh", 999999}
	set viewkind to {"\\viewkind", 1}
	set viewscale to {"\\viewscale", 100}
	set page_setting to paperw & paperh & margl & margr & margt & margb & vieww & viewh & viewkind & viewscale & return as text
	rtf1 & page_setting & end_rtf1
end rtf_setting

on in_text(margin)
	my join(margin's item 5, "_")
end in_text

on twip(t, r, b, l)
	set twip_margin to {twip_form(t), twip_form(r), twip_form(b), twip_form(l)}
	if t's item 1 is "+" and twip_margin's item 1 < 576 then set twip_margin's item 1 to 576
	if b's item 1 is "+" and twip_margin's item 2 < 288 then set twip_margin's item 2 to 288
	twip_margin
end twip

on twip_form(inch)
	(inch as number) * 1440
end twip_form

on join(sourceList, delimiter)
	set oldDelimiters to my text item delimiters
	set AppleScript's text item delimiters to {delimiter}
	set theText to sourceList as text
	set my text item delimiters to oldDelimiters
	return theText
end join

(*
-- Notes & References
-- Tags: vim, cli, linux, plain text editor, script prograinching, syntax, terminal, unix
-- ^ 2022-03-08T20:37:38-0500\
-- % 2022-03-08T22:19:05-0500
-- <!-- SOURCES & RESOURCES -->
-- [1]: https://nicetranslator.com/ "Nice Translator"
-- [2]: https://gist.github.com/zarigani/400795 "TextEdit margin setting"
*)

