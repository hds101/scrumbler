#!/usr/bin/env ruby

class Scrumbler
  def initialize
    @edges = %w[L R U D F B]
    @edges += @edges.map { |e| "#{e}2"}
    @edges += @edges.map { |e| "#{e}'" }
    @result = []
  end

  def sequence
    20.times { @result << find_match }
    @result
  end

  private

  def find_match
    current = @result.last || @edges.sample
    next_edge = @edges.sample
    return next_edge unless similar?(current, next_edge)
    find_match
  end

  def similar?(current, next_edge)
    groups = [%w[L R], %w[U D], %w[F B]]
    raw = [current, next_edge].map { |edge| edge.sub(/2\'|2|\'/, '') }
    groups.each do |group|
      return true if (group | raw).size == 2
    end
    false
  end
end

sequence = Scrumbler.new.sequence
puts sequence.join(' ')
