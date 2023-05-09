const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();
  
    console.log("Contract deployed to:", waveContract.address);
    console.log("Contract deployed by:", owner.address);
    console.log("random person address deployed by:", owner.address);
  
    await waveContract.getTotalWaves();

    const firstWaveTxn = await waveContract.wave();
    await firstWaveTxn.wait();

    await waveContract.getSmartContractBalance(owner.address)
    
    await waveContract.getTotalWaves();
  
    const secondWaveTxn = await waveContract.connect(randomPerson).wave();
    await secondWaveTxn.wait();
  
    await waveContract.getTotalWaves();

    await waveContract.getAllAccountsThatSentWaves()
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();