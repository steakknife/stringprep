module Stringprep
  extend self

  # Determine whether code is in tableA.1 (Unassigned code points in Unicode 3.2).
  def in_a1(code)
    @a1 ||= Table::In.create_read_only(Rfc3454.tables['a1'])
    @a1.include?(code)
  end

  # Determine whether code is in tableB.1 (Commonly mapped to nothing).
  def in_b1(code)
    @b1 ||= Table::In.create_read_only(Rfc3454.tables['b1'])
    @b1.include?(code)
  end

  # Return the mapped value for code according to tableB.2 (Mapping for case-folding used with NFKC).
  def map_b2(code)
    @b2 ||= Table::Map.create_read_only(Rfc3454.tables['b2'])
    @b2.map(code)
  end

  # Return the mapped value for code according to tableB.3 (Mapping for case-folding used with no normalization).
  def map_b3(code)
    @b3 ||= Table::Map.create_read_only(Rfc3454.tables['b3'])
    @b3.map(code)
  end

  # Determine whether code is in tableC.1.1 (ASCII space characters).
  def in_c11(code)
    @c11 ||= Table::In.create_read_only(Rfc3454.tables['c11'])
    @c11.include? code
  end

  # Determine whether code is in tableC.1.2 (Non-ASCII space characters).
  def in_c12(code)
    @c12 ||= Table::In.create_read_only(Rfc3454.tables['c12'])
    @c12.include? code
  end

  # Determine whether code is in tableC.1 (Space characters, union of C.1.1 and C.1.2).
  def in_c11_c12(code)
    in_c11(code) || in_c12(code)
  end

  # Determine whether code is in tableC.2.1 (ASCII control characters).
  def in_c21(code)
    @c21 ||= Table::In.create_read_only(Rfc3454.tables['c21'])
    @c21.include? code
  end

  # Determine whether code is in tableC.2.2 (Non-ASCII control characters).
  def in_c22(code)
    @c22 ||= Table::In.create_read_only(Rfc3454.tables['c22'])
    @c22.include? code
  end

  # Determine whether code is in tableC.2 (Control characters, union of C.2.1 and C.2.2).
  def in_c21_c22(code)
    in_c21(code) || in_c22(code)
  end

  # Determine whether code is in tableC.3 (Private use).
  def in_c3(code)
    @c3 ||= Table::In.create_read_only(Rfc3454.tables['c3'])
    @c3.include?(code)
  end

  # Determine whether code is in tableC.4 (Non-character code points).
  def in_c4(code)
    @c4 ||= Table::In.create_read_only(Rfc3454.tables['c4'])
    @c4.include?(code)
  end

  # Determine whether code is in tableC.5 (Surrogate codes).
  def in_c5(code)
    @c5 ||= Table::In.create_read_only(Rfc3454.tables['c5'])
    @c5.include?(code)
  end

  # Determine whether code is in tableC.6 (Inappropriate for plain text).
  def in_c6(code)
    @c6 ||= Table::In.create_read_only(Rfc3454.tables['c6'])
    @c6.include?(code)
  end

  # Determine whether code is in tableC.7 (Inappropriate for canonical representation).
  def in_c7(code)
    @c7 ||= Table::In.create_read_only(Rfc3454.tables['c7'])
    @c7.include?(code)
  end

  # Determine whether code is in tableC.8 (Change display properties or are deprecated).
  def in_c8(code)
    @c8 ||= Table::In.create_read_only(Rfc3454.tables['c8'])
    @c8.include?(code)
  end

  # Determine whether code is in tableC.9 (Tagging characters).
  def in_c9(code)
    @c9 ||= Table::In.create_read_only(Rfc3454.tables['c9'])
    @c9.include?(code)
  end

  # Determine whether code is in tableD.1 (Characters with bidirectional property “R” or “AL”).
  def in_d1(code)
    @d1 ||= Table::In.create_read_only(Rfc3454.tables['d1'])
    @d1.include?(code)
  end

  # Determine whether code is in tableD.2 (Characters with bidirectional property “L”).
  def in_d2(code)
    @d2 ||= Table::In.create_read_only(Rfc3454.tables['d2'])
    @d2.include?(code)
  end

private

  autoload :Rfc3454, 'stringprep/rfc3454'

  module Table
    autoload :In, 'stringprep/table/in'
    autoload :Map, 'stringprep/table/map'
  end
end
