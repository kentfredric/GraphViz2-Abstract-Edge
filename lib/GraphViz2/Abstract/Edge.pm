use strict;
use warnings;
use utf8;

package GraphViz2::Abstract::Edge;

# ABSTRACT: Deal with edges independent of a Graph

use constant FALSE        => q[false];
use constant TRUE         => q[true];
use constant EMPTY_STRING => q[];
use constant UNKNOWN      => \q[unknown];
use constant NONE         => \q[none];

our @CARP_NOT;

=head1 SYNOPSIS

    use GraphViz2::Abstract::Edge;

    my $edge = GraphViz2::Abstract::Edge->new(
            color =>  ... ,
            id    =>  ... ,
            label =>  ... ,
    );

    # Mutate $edge

    $edge->label("Asdft");

    my $fillcolor = $edge->fillcolor(); # Knows that the fill color is light grey despite never setting it.

    # Later:

    $graph->add_edge(from => a => to => b => %{ $edge->as_hash }); # Adds only the data that is not the same as GraphViz's defaults
    $graph->add_edge(from => a => to => b => %{ $edge->as_canon_hash }); # Adds all the data, including hardcoded defaults

=head1 DESCRIPTION

Working with GraphViz2, I found myself frequently needing shared styles for things, and I often had trouble knowing
which fields were and weren't valid for given things, for instance: C<Edge>s.

Its reasonably straight forward to ask the question "What is the attribute C<foo> applicable to" using the GraphViz website,
but much harder to know "What are all the attributes applicable to C<foo>".

Let alone work with them in a user friendly way from code.

=head2 Naming Rationale

I tried to choose a name that was not so likely to threaten GraphViz2 if GraphViz2 wanted to make a different
variation of what I'm doing, but as part of GraphViz2 itself.

As such, I plan on a few C<::Abstract> things, that aim to be stepping stones for dealing with complex data independent of C<GraphViz2>,
but in such a way that they make importing that data into C<GraphViz2> easy.

=cut

use Class::Tiny {
  URL            => NONE,
  arrowhead      => 'normal',
  arrowsize      => 0.0,
  arrowtail      => 'normal',
  color          => 'black',
  colorscheme    => EMPTY_STRING,
  comment        => EMPTY_STRING,
  constraint     => TRUE,
  decorate       => FALSE,
  dir            => UNKNOWN,
  edgeURL        => EMPTY_STRING,
  edgehref       => EMPTY_STRING,
  edgetarget     => NONE,
  edgetooltip    => EMPTY_STRING,
  fillcolor      => UNKNOWN,
  fontcolor      => 'black',
  fontname       => 'Times-Roman',
  fontsize       => 14.0,
  headURL        => EMPTY_STRING,
  head_lp        => UNKNOWN,
  headclip       => TRUE,
  headhref       => EMPTY_STRING,
  headlabel      => EMPTY_STRING,
  headport       => 'center',
  headtarget     => NONE,
  headtooltip    => EMPTY_STRING,
  href           => EMPTY_STRING,
  id             => EMPTY_STRING,
  label          => EMPTY_STRING,
  labelURL       => EMPTY_STRING,
  labelangle     => -25.0,
  labeldistance  => 1.0,
  labelfloat     => FALSE,
  labelfontcolor => 'black',
  labelfontname  => 'Times-Roman',
  labelfontsize  => 14.0,
  labelhref      => EMPTY_STRING,
  labeltarget    => NONE,
  labeltooltip   => EMPTY_STRING,
  layer          => EMPTY_STRING,
  len            => UNKNOWN,         # backend dependent
  lhead          => EMPTY_STRING,
  lp             => UNKNOWN,
  ltail          => EMPTY_STRING,
  minlen         => 1,
  nojustify      => FALSE,
  penwidth       => 1.0,
  pos            => UNKNOWN,
  samehead       => EMPTY_STRING,
  sametail       => EMPTY_STRING,
  showboxes      => 0,
  style          => EMPTY_STRING,
  tailURL        => EMPTY_STRING,
  tail_lp        => UNKNOWN,
  tailclip       => TRUE,
  tailhref       => EMPTY_STRING,
  taillabel      => EMPTY_STRING,
  tailport       => 'center',
  tailtarget     => NONE,
  tailtooltip    => EMPTY_STRING,
  target         => NONE,
  tooltip        => EMPTY_STRING,
  weight         => 1,
  xlabel         => EMPTY_STRING,
  xlp            => UNKNOWN,
};

=attr C<URL>

Default: L<< C<none>|/NONE >>

=attr C<arrowhead>

Default: C<'normal'>

=attr C<arrowsize>

Default: C<0.0>

=attr C<arrowtail>

Default: C<'normal'>

=attr C<color>

Default: C<'black'>

=attr C<colorscheme>

Default: C<"">

=attr C<comment>

Default: C<"">

=attr C<constraint>

Default: L<< C<true>|/true >>

=attr C<decorate>

Default: L<< C<false>|/false >>

=attr C<dir>

Default: L<< C<unknown>|/UNKNOWN >>

=attr C<edgeURL>

Default: C<"">

=attr C<edgehref>

Default: C<"">

=attr C<edgetarget>

Default: L<< C<none>|/NONE >>

=attr C<edgetooltip>

Default: C<"">

=attr C<fillcolor>

Default: L<< C<unknown>|/UNKNOWN >>

=attr C<fontcolor>

Default: C<'black'>

=attr C<fontname>

Default: C<'Times-Roman'>

=attr C<fontsize>

Default: C<14.0>

=attr C<headURL>

Default: C<"">

=attr C<head_lp>

Default: L<< C<unknown>|/UNKNOWN >>

=attr C<headclip>

Default: L<< C<true>|/true >>

=attr C<headhref>

Default: C<"">

=attr C<headlabel>

Default: C<"">

=attr C<headport>

Default: C<'center'>

=attr C<headtarget>

Default: L<< C<none>|/NONE >>

=attr C<headtooltip>

Default: C<"">

=attr C<href>

Default: C<"">

=attr C<id>

Default: C<"">

=attr C<label>

Default: C<"">

=attr C<labelURL>

Default: C<"">

=attr C<labelangle>

Default: C<-25.0>

=attr C<labeldistance>

Default: C<1.0>

=attr C<labelfloat>

Default: L<< C<false>|/false >>

=attr C<labelfontcolor>

Default: C<'black'>

=attr C<labelfontname>

Default: C<'Times-Roman'>

=attr C<labelfontsize>

Default: C<14.0>

=attr C<labelhref>

Default: C<"">

=attr C<labeltarget>

Default: L<< C<none>|/NONE >>

=attr C<labeltooltip>

Default: C<"">

=attr C<layer>

Default: C<"">

=attr C<len>

Default: L<< C<unknown>|/UNKNOWN >>

Reason: back-end dependent

=attr C<lhead>

Default: C<"">

=attr C<lp>

Default: L<< C<unknown>|/UNKNOWN >>

=attr C<ltail>

Default: C<"">

=attr C<minlen>

Default: C<1>

=attr C<nojustify>

Default: L<< C<false>|/false >>

=attr C<penwidth>

Default: C<1.0>

=attr C<pos>

Default: L<< C<unknown>|/UNKNOWN >>

=attr C<samehead>

Default: C<"">

=attr C<sametail>

Default: C<"">

=attr C<showboxes>

Default: 0

=attr C<style>

Default: C<"">

=attr C<tailURL>

Default: C<"">

=attr C<tail_lp>

Default: L<< C<unknown>|/UNKNOWN >>

=attr C<tailclip>

Default: L<< C<true>|/true >>

=attr C<tailhref>

Default: C<"">

=attr C<taillabel>

Default: C<"">

=attr C<tailport>

Default: C<'center'>

=attr C<tailtarget>

Default: L<< C<none>|/NONE >>

=attr C<tailtooltip>

Default: C<"">

=attr C<target>

Default: L<< C<none>|/NONE >>

=attr C<tooltip>

Default: C<"">

=attr C<weight>

Default: C<1>

=attr C<xlabel>

Default: C<"">

=attr C<xlp>

Default: L<< C<unknown>|/UNKNOWN >>

=cut

use Scalar::Util qw(blessed);
use Scalar::Util qw(refaddr);

sub _is_equal {
  my ( $self, $a_ref, $b_ref ) = @_;

  return   if defined $a_ref     and not defined $b_ref;
  return   if not defined $a_ref and defined $b_ref;
  return 1 if not defined $a_ref and not defined $b_ref;

  ## A and B are both defined.

  return if not ref $a_ref and ref $b_ref;
  return if ref $a_ref and not $b_ref;

  if ( not ref $a_ref and not ref $b_ref ) {
    return $a_ref eq $b_ref;
  }

  ##  A and B are both refs.
  return refaddr $a_ref eq refaddr $b_ref;
}

sub _is_magic {
  my ( $self, $value ) = @_;
  return if not defined $value;
  return if not ref $value;
  my $addr = refaddr $value;
  return 1 if $addr eq refaddr UNKNOWN;
  return 1 if $addr eq refaddr NONE;
  return;
}

sub _foreach_attr {
  my ( $self, $callback ) = @_;
  if ( not blessed($self) ) {
    require Carp;
    local @CARP_NOT = 'GraphViz2::Abstract::Edge';
    Carp::croak('Can\'t call as_hash on a class');
  }
  my $class    = blessed($self);
  my @attrs    = Class::Tiny->get_all_attributes_for($class);
  my $defaults = Class::Tiny->get_all_attribute_defaults_for(__PACKAGE__);
  for my $attr (@attrs) {
    my $value       = $self->$attr();
    my $has_default = exists $defaults->{$attr};
    my $default;
    if ($has_default) {
      $default = $defaults->{$attr};
    }
    $callback->( $attr, $value, $has_default, $default );
  }
  return $self;
}

=method C<as_hash>

This method returns all the values of all properties that B<DIFFER> from the defaults.

e.g.

    Edge->new( color => 'black' )->as_hash();

Will return an empty list, as the default color is normally black.

See note about L<< C<Special Values>|/SPECIAL VALUES >>

=cut

sub as_hash {
  my ($self) = @_;
  my %output;

  $self->_foreach_attr(
    sub {
      my ( $attr, $value, $has_default, $default ) = @_;
      if ( not $has_default ) {
        return if $self->_is_magic($value);
        $output{$attr} = $value;
        return;
      }
      return if $self->_is_equal( $value, $default );
      return if $self->_is_magic($value);
      $output{$attr} = $value;
    }
  );
  return \%output;
}

=method C<as_canon_hash>

This method returns all the values of all properties, B<INCLUDING> defaults.

e.g.

    Edge->new( color => 'black' )->as_canon_hash();

Will return a very large list containing all the properties that we know the default values for.

See note about L<< C<Special Values>|/SPECIAL VALUES >>

=cut

sub as_canon_hash {
  my ($self) = @_;
  my %output;
  $self->_foreach_attr(
    sub {
      my ( $attr, $value, $has_default, $default ) = @_;
      return if $self->_is_magic($value);
      $output{$attr} = $value;
    }
  );
  return \%output;

}

=head1 SPECIAL VALUES

In the specification, on GraphViz.org, there are a number of special values
which represent a fundamental incompatibility with native Perl code.

=over 4

=item * C<false>

Where the specification shows C<false> as a default value, this module instead returns the string C<false>

This is because under the hood, GraphViz2 doesn't support values for attributes other than defined ones.

So its assumed that GraphViz, under the hood, interprets the string "false" the same as the boolean condition "false";

=item * C<true>

Where the specification shows C<true> as a default value, this module instead returns the string C<true>

Its assumed that GraphViz, under the hood, interprets the string "true" the same as the boolean condition "true",
for similar reasons L<< C<false>|/false >> is.

=item * C<NONE>

In the GraphViz docs, a few items have a default value specified as:

    <none>

This item was confusing in the specification, and it wasn't clear if it was some sort of magic string, or what.

Internally, we use a special value, a reference to a string "none" to represent this default.

For instance:

    my $v = Edge->new()->target();

    ok( ref $v, 'target returned a ref' );
    is( ref $v, 'SCALAR', 'target returned a scalar ref' );
    is( ${ $v }, 'none', 'target returned a scalar ref of "none"' );

However, because its not known how to canonicalize such forms, those values are presently not returned by either C<as_hash> methods.

So as a result:

    my $v = Edge->new( color => \"none" )->as_hash()

Will emit an empty hash. ( Despite "none" being different from the default ).

Also:

    my $v = Edge->new( color => \"none" )->as_canon_hash()

Will not emit a value for C<color> in its output, which may have the undesirable effect of reverting to the default, C<black> once rendered.

=item * C<UNKNOWN>

On the GraphViz documentations, there were quite a few fields where the defaults were simply not specified,
or their values were cryptic.

Internally, those fields have the default value of C<\"unknown">

Like C<"none">, those fields with those values will not be emitted during hash production.

=back

=cut

1;
