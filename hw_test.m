hw05_worker = hw05();

hw_assert(abs ( hw05_worker.p1([2, 1], 1)) < 1e-8);
hw_assert(abs ( hw05_worker.p1([4, 2, 1], [1,2])) < 1e-8);
hw_assert(abs ( hw05_worker.p1([1, 2, 4], [1,2]) - 7) < 1e-8);
hw_assert(abs ( hw05_worker.p1([5, 4, 3], [1,3]) - 13/7) < 1e-8);
hw_assert(abs ( hw05_worker.p1([5, 4, 3, 2, 1], [1,2,3,4]) + 19/35) < 1e-8);
hw_assert(abs ( hw05_worker.p1([64, 8, 4, 1], [1,2,3]) + 16/3) < 1e-8);


hw_assert(abs ( hw05_worker.p2(1)   - 0.7853981633974483) < 1e-6);
hw_assert(abs ( hw05_worker.p2(0.8) - 0.7436078366584389) < 1e-6);
hw_assert(abs ( hw05_worker.p2(0.5) - 0.6676914571896092) < 1e-6);
hw_assert(abs ( hw05_worker.p2(0.2) - 0.5737108471859466) < 1e-6);

hw_assert(abs ( hw05_worker.p3([-1, 0, 1]) - [-0.5, 0, 0.5]') < 1e-8);
hw_assert(abs ( hw05_worker.p3([-2, -1, 1]) - [0, -0.5, 0.5]') < 1e-8);
hw_assert(abs ( hw05_worker.p3([-2, -3, 6]) - [3/8, -4/9, 5/72]') < 1e-8);

function hw_assert(X)
    if X; fprintf('\t PASS\n'); else; fprintf('\t FAIL\n'); end
end