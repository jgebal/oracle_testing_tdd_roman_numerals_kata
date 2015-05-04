require_relative 'spec_helper'
require_relative 'to_roman_numeral'

describe 'Decimal to roman numeral converter' do

  roman_numbers = %w{I II III IV V VI VII VIII IX X XI XII XIII XIV XV XVI XVII XVIII XIX XX
                     XXI XXII XXIII XXIV XXV XXVI XXVII XXVIII XXIX XXX XXXI XXXII XXXIII XXXIV XXXV XXXVI XXXVII XXXVIII XXXIX XL
                     XLI XLII XLIII XLIV XLV XLVI XLVII XLVIII XLIX L LI LII LIII LIV LV LVI LVII LVIII LIX LX
                     LXI LXII LXIII LXIV LXV LXVI LXVII LXVIII LXIX LXX LXXI LXXII LXXIII LXXIV LXXV LXXVI LXXVII LXXVIII LXXIX LXXX
                     LXXXI LXXXII LXXXIII LXXXIV LXXXV LXXXVI LXXXVII LXXXVIII LXXXIX XC XCI XCII XCIII XCIV XCV XCVI XCVII XCVIII XCIX C
                    }
  (1..roman_numbers.size).each do |given|

    expected = roman_numbers[given-1]

    it "should return #{expected} for #{given}" do
      expect( plsql.to_roman_numeral(given) ).to eq( expected )
    end

  end

  [
    [200	,'CC'],
    [300	,'CCC'],
    [400	,'CD'],
    [500	,'D'],
    [600	,'DC'],
    [700	,'DCC'],
    [800	,'DCCC'],
    [900	,'CM'],
    [2015, 'MMXV'],
  ].each do |given, expected|

    it "should return #{expected} for #{given}" do
      expect( plsql.to_roman_numeral(given) ).to eq( expected )
    end

  end

  it 'should raise exception for 3001' do
    expect{ plsql.to_roman_numeral(3001) }.to raise_exception(/works only up to 3000/)

  end


end