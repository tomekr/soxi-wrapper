module Soxi
  module Wrapper
    class File
      attr_reader :filename
      def initialize filename
        @filename = filename
      end

      def filetype
        @filetype ||= run('t')
      end

      def samplerate
        @samplerate ||= run('r')
      end

      def channels
        @channels ||= run('c').to_i
      end

      def samples
        @samples ||= run('s').to_i
      end

      def duration
        @duration ||= run('d')
      end

      def seconds
        @seconds ||= run('D').to_f
      end

      def bits_per_sample
        @bits_per_sample ||= run('b').to_i
      end

      def average_bitrate
        @average_bitrate ||= run('B')
      end

      def encoding
        @encoding ||= run('e')
      end

      def comments
        @comments ||= run('a', false)
      end

      private

      def run option, remove_newlines=true
        val = `soxi -#{option} #{filename}`
        if remove_newlines
          return val.gsub(/\n/,'')
        end
        val
      end
    end
  end
end
