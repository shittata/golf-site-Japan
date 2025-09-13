// app/assets/javascripts/custom.js

function showRanking(rankingId) {
    // すべてのタブボタンとランキングコンテナから 'active' クラスを削除する
    document.querySelectorAll('.tab-button').forEach(button => {
        button.classList.remove('active');
    });

    document.querySelectorAll('.ranking-container').forEach(container => {
        container.classList.remove('active');
    });

    // クリックされたボタンに対応する要素にだけ 'active' クラスを追加する
    const button = document.querySelector(`.tab-button[onclick="showRanking('${rankingId}')"]`);
    if (button) {
        button.classList.add('active');
    }
    
    const container = document.getElementById(rankingId);
    if (container) {
        container.classList.add('active');
    }
}