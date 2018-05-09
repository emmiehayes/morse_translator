require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def test_it_exists
    translator = Translator.new
    assert_instance_of Translator, translator
  end

  def test_it_can_translate_single_letter
    translator = Translator.new
    assert_equal ".-", translator.eng_to_morse("a")
  end

  def test_it_can_translate_single_word
    translator = Translator.new
    assert_equal "-..-----.", translator.eng_to_morse("dog")
  end

  def test_it_can_translate_a_space
    translator = Translator.new
    assert_equal "-..-----. .--..-.--",translator.eng_to_morse("dog paw")
  end

  def test_it_can_translate_case_sensitive
    translator = Translator.new
    result = "......-...-..--- .-----.-..-..-.."
    assert_equal result, translator.eng_to_morse("Hello World")
  end

  def test_it_can_translate_a_number
    translator = Translator.new
    result = "-......-.. .-.-.. ...-- ..........--...."
    assert_equal result, translator.eng_to_morse("There are 3 ships")
  end

  def test_it_can_read_text_from_a_file_and_translate
    translator = Translator.new
    result = "-.-..-- ..-..-.----- ..-....-..."
    assert_equal result, translator.from_file("input.txt")
  end

  def test_it_can_translate_in_reverse
    translator = Translator.new
    result = "hello world"
    assert_equal result, translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")
  end
end
