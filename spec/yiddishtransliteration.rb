require_relative '../lib/yiddishtransliteration.rb'

describe YiddishTransliterate do
   context 'When testing the YiddishTransliterate class' do
      yt = YiddishTransliterate.new
      it 'should transliterate מען as men' do
         token = 'מען'
         trans = yt.transliterate token
         expect(trans).to eq 'men'
      end
      it 'should translate punctuation correctly' do
        token = '„יד־ושם‟'
        trans = yt.transliterate token
        expect(trans).to eq '"id-ushm"'
      end
      it 'should transliterate complex phonemes correctly' do
        token = 'דזשדז'
        trans = yt.transliterate token
        expect(trans).to eq 'dzhdz'
      end
      it 'should transliterate ייִדישן as yidishn' do
        token = 'ייִדישן'
        trans = yt.transliterate token
        expect(trans).to eq 'yidishn'
      end
   end
end
