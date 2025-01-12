function [energyx] = energ(dig_sqn_1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

energyx = sum(abs(dig_sqn_1).^2)
end

