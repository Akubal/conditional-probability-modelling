function condProbSuccess = ProbSuccess(ProbSuc, ProbPosSuc, ProbPosFail, NPos, NNeg)
    probReviewsGivenSuccess = (ProbPosSuc^NPos) * ((1 - ProbPosSuc)^NNeg);
    
    probReviewsGivenFailure = (ProbPosFail^NPos) * ((1 - ProbPosFail)^NNeg);
    
    condProbSuccess = (probReviewsGivenSuccess * ProbSuc) / ...
        ((probReviewsGivenSuccess * ProbSuc) + (probReviewsGivenFailure * (1 - ProbSuc)));
end


