my class Regex {
    multi method ACCEPTS(Regex:D \SELF: Mu \topic) {
        my $dollar_slash := pir::find_caller_lex_relative__PPs(
            nqp::ctxcaller(nqp::ctxcaller(nqp::ctx())),
            '$/');
        $dollar_slash = SELF.(Cursor."!cursor_init"(topic, :c(0))).MATCH_SAVE;
    }

    multi method ACCEPTS(Regex:D \SELF: @a) {
        my $dollar_slash := pir::find_caller_lex_relative__PPs(
            nqp::ctxcaller(nqp::ctxcaller(nqp::ctx())),
            '$/');
        for @a {
            $dollar_slash = SELF.(Cursor.'!cursor_init'($_, :c(0))).MATCH_SAVE;
            return $dollar_slash if $dollar_slash;
        }
        Nil;
    }
    multi method ACCEPTS(Regex:D \SELF: %h) {
        my $dollar_slash := pir::find_caller_lex_relative__PPs(
            nqp::ctxcaller(nqp::ctxcaller(nqp::ctx())),
            '$/');
        for %h.keys {
            $dollar_slash = SELF.(Cursor.'!cursor_init'($_, :c(0))).MATCH_SAVE;
            return $dollar_slash if $dollar_slash;
        }
        Nil;
    }

    multi method Bool(Regex:D:) {
        my $dollar_slash := pir::find_caller_lex_relative__PPs(
            nqp::ctxcaller(nqp::ctxcaller(nqp::ctx())),
            '$/');
        my $dollar_underscore := pir::find_caller_lex_relative__PPs(
            nqp::ctxcaller(nqp::ctxcaller(nqp::ctx())),
            '$_');
        $dollar_slash = $dollar_underscore.match(self);
        $dollar_slash.Bool()
    }
}
