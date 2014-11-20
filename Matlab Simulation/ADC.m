function [outputBinary outputDB] = ADC(inputSignal)

conversion = dec2bin(uint16(inputSignal))


% do we need to handle something when we go to 1024 and exceed the 10 bit
% limit

% flip the signal so that we can cut it easier or add zeros if needed
signalBinary_10 = conversion(end:-1:1)

if length(signalBinary_10) >= 10
    signalBinary_10 = signalBinary_10(1:10)
else
    for i = length(signalBinary_10):1:10
        signalBinary_10 = [signalBinary_10 '0']
    end
        
end

% flip back

signalBinary_10 = signalBinary_10(end:-1:1)

ouputBinary = signalBinary_10;
output = bin2dec(signalBinary_10)
outputDB = mag2db(output)