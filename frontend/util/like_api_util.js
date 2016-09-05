export const createLike = (rId, success) => {
  $.ajax({
    url: `/api/likes.json`,
    type: "POST",
    data: { id: rId },
    success
  });
};

export const destroyLike = (rId, success) => {
  $.ajax({
    url: `/api/likes/1.json`,
    type: "DELETE",
    data: { recipe_id: rId },
    success
  });
};
