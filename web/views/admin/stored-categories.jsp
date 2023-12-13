<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:include page="/views/partials/adminHeader.jsp" />
<main class="flex">
    <jsp:include page="/views/partials/adminSidebar.jsp" />

    <div class="content bg-gray-900 px-6 w-full">
        <h1 class="my-6 font-bold text-lg text-gray-300">Categories</h1>
        
        <!-- below product -->
        <div class="p-4 bg-gray-800 rounded-lg mb-5">
          <div class="flex justify-between pt-3">
            <!-- left -->
            <div class="flex space-x-3 text-white">
              <div>
                <button
                  class="flex py-2 border justify-center items-center border-gray-300 cursor-pointer h-10 w-20 rounded text-gray-300"
                >
                  <svg
                    stroke="currentColor"
                    fill="none"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="mr-2"
                    height="1em"
                    width="1em"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"
                    ></path>
                    <polyline points="17 8 12 3 7 8"></polyline>
                    <line x1="12" y1="3" x2="12" y2="15"></line>
                  </svg>
                  <span class="text-xs">Export</span>
                </button>
              </div>
            </div>

            <!-- right -->
            <div class="flex gap-4">
              <div>
                <form>
                  <button
                    class="flex items-center justify-center h-12 px-4 py-2 rounded-md text-sm text-white bg-red-600 border border-transparent w-full opacity-60 disabled"
                  >
                    <svg
                      class="mr-2"
                      stroke="currentColor"
                      fill="none"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      height="1em"
                      width="1em"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <polyline points="3 6 5 6 21 6"></polyline>
                      <path
                        d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"
                      ></path>
                      <line x1="10" y1="11" x2="10" y2="17"></line>
                      <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg>
                    <span>Delete</span>
                  </button>
                  <button type="submit" class="hidden"></button>
                </form>
              </div>
              <div>
                <form>
                  <button
                    class="flex items-center justify-center h-12 px-4 py-2 rounded-md text-sm text-white bg-emerald-500 border border-transparent w-full"
                  >
                    <svg
                      class="mr-2"
                      stroke="currentColor"
                      fill="none"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      height="1em"
                      width="1em"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <line x1="12" y1="5" x2="12" y2="19"></line>
                      <line x1="5" y1="12" x2="19" y2="12"></line>
                    </svg>
                    <span>Add Category</span>
                  </button>
                  <button type="submit" class="hidden"></button>
                </form>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Table -->
        <div
          class="w-full border border-gray-700 rounded-lg mb-8 rounded-b-lg"
        >
          <div class="w-full">
            <table class="text-white w-full font-">
              <thead
                class="text-xs font-semibold tracking-wide text-left text-gray-400 uppercase border-b border-gray-700 bg-gray-800"
              >
                <tr>
                  <th class="py-2 px-4">
                    <input type="checkbox" />
                  </th>
                  <th class="py-2 px-4">ID</th>
                  <th class="py-2 px-4">ICON</th>
                  <th class="py-2 px-4">CATEGORY NAME</th>
                  <th class="py-2 px-4 text-center">CHILD CATEGORY</th>
                  <th class="py-2 px-4 text-center">ACTIONS</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="category" items="${categories}">
                    <c:if test="${category.getParentId() == null}">
                            <tr class="border-b border-gray-700">
                        <td class="py-2 px-4">
                          <input type="checkbox" />
                        </td>
                        <td class="py-2 px-4">1</td>
                        <td class="py-2 px-4">
                          <div class="w-8 h-8 mr-2">
                            <img
                              class="object-cover rounded-full"
                              src="https://res.cloudinary.com/ahossain/image/upload/v1682058933/product/CMTHP-COR12-deep-ash-920x920.webp"
                              alt=""
                            />
                          </div>
                        </td>
                        <td class="py-2 px-4">
                          <div class="flex items-center">
                            <span class="text-sm font-semibold">${category.getName()}</span>
                          </div>
                        </td>

                        <td class="flex flex-col py-2 px-4 justify-center" style="min-height: 59px">
                            <c:forEach var="child" items="${category.getChildren()}">
                                <div class="flex items-center">
                            <span class="text-xs text-gray-500 pr-1">
                              <svg
                                stroke="currentColor"
                                fill="currentColor"
                                stroke-width="0"
                                viewBox="0 0 512 512"
                                height="1em"
                                width="1em"
                                xmlns="http://www.w3.org/2000/svg"
                              >
                                <path
                                  fill="none"
                                  stroke-linecap="square"
                                  stroke-linejoin="round"
                                  stroke-width="32"
                                  d="M400 256H112"
                                ></path>
                              </svg>
                            </span>
                            <span class="text-sm text-left font-medium"
                              >${child.getName()}</span
                            >
                          </div>
                            </c:forEach>
                        </td>

                        <td class="py-2 px-4 text-center">
                          <div>
      <!--                      <a
                              href="#"
                              class="inline-block align-bottom p-2 cursor-pointer text-gray-400"
                            >
                              <p data-tip="true" data-for="view" class="text-xl">
                                <svg
                                  stroke="currentColor"
                                  fill="none"
                                  stroke-width="2"
                                  viewBox="0 0 24 24"
                                  stroke-linecap="round"
                                  stroke-linejoin="round"
                                  height="1em"
                                  width="1em"
                                  xmlns="http://www.w3.org/2000/svg"
                                >
                                  <circle cx="11" cy="11" r="8"></circle>
                                  <line
                                    x1="21"
                                    y1="21"
                                    x2="16.65"
                                    y2="16.65"
                                  ></line>
                                  <line x1="11" y1="8" x2="11" y2="14"></line>
                                  <line x1="8" y1="11" x2="14" y2="11"></line>
                                </svg>
                              </p>
                            </a>-->
                            <a class="edit-btn inline-block p-2 cursor-pointer text-gray-400">
                              <p class="text-xl">
                                <svg
                                  stroke="currentColor"
                                  fill="none"
                                  stroke-width="2"
                                  viewBox="0 0 24 24"
                                  stroke-linecap="round"
                                  stroke-linejoin="round"
                                  height="1em"
                                  width="1em"
                                  xmlns="http://www.w3.org/2000/svg"
                                >
                                  <path
                                    d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"
                                  ></path>
                                  <path
                                    d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"
                                  ></path>
                                </svg>
                              </p>
                            </a>
                            <a class="delete-btn inline-block p-2 cursor-pointer text-gray-400">
                              <p class="text-xl">
                                <svg
                                  stroke="currentColor"
                                  fill="none"
                                  stroke-width="2"
                                  viewBox="0 0 24 24"
                                  stroke-linecap="round"
                                  stroke-linejoin="round"
                                  height="1em"
                                  width="1em"
                                  xmlns="http://www.w3.org/2000/svg"
                                >
                                  <polyline points="3 6 5 6 21 6"></polyline>
                                  <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"
                                  ></path>
                                  <line x1="10" y1="11" x2="10" y2="17"></line>
                                  <line x1="14" y1="11" x2="14" y2="17"></line>
                                </svg>
                              </p>
                            </a>
                          </div>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
              </tbody>
            </table>
          </div>

          <!-- left -->
          <div class="px-4 py-3 text-gray-400 bg-gray-800">
            <div class="flex justify-between text-sm text-gray-400">
              <span
                class="flex items-center font-semibold tracking-wide uppercase"
                >Showing 1-20 of 310
              </span>

              <!-- paging -->
              <div class="flex mt-2 sm:mt-auto sm:justify-end">
                <nav aria-label="Product Page Navigation">
                  <ul class="inline-flex items-center">
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none p-2 rounded-md text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent opacity-50 cursor-not-allowed"
                        disabled=""
                        type="button"
                        aria-label="Previous"
                      >
                        <svg
                          class="h-3 w-3"
                          aria-hidden="true"
                          fill="currentColor"
                          viewBox="0 0 20 20"
                        >
                          <path
                            d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                            clip-rule="evenodd"
                            fill-rule="evenodd"
                          ></path>
                        </svg>
                      </button>
                    </li>
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-white bg-emerald-500 border border-transparent active:bg-emerald-600 hover:bg-emerald-600"
                        type="button"
                      >
                        1
                      </button>
                    </li>
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                        type="button"
                      >
                        2
                      </button>
                    </li>
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                        type="button"
                      >
                        3
                      </button>
                    </li>
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                        type="button"
                      >
                        4
                      </button>
                    </li>
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                        type="button"
                      >
                        5
                      </button>
                    </li>
                    <li><span class="px-2 py-1">...</span></li>
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none px-3 py-1 rounded-md text-xs text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                        type="button"
                      >
                        16
                      </button>
                    </li>
                    <li>
                      <button
                        class="align-bottom inline-flex items-center justify-center cursor-pointer leading-5 transition-colors duration-150 font-medium focus:outline-none p-2 rounded-md text-gray-600 dark:text-gray-400 focus:outline-none border border-transparent active:bg-transparent hover:bg-gray-100 dark:hover:bg-gray-500 dark:hover:text-gray-300 dark:hover:bg-opacity-10"
                        type="button"
                        aria-label="Next"
                      >
                        <svg
                          class="h-3 w-3"
                          aria-hidden="true"
                          fill="currentColor"
                          viewBox="0 0 20 20"
                        >
                          <path
                            d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                            clip-rule="evenodd"
                            fill-rule="evenodd"
                          ></path>
                        </svg>
                      </button>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
    </div>

    <!-- model -->
    <div
      id="product-edit-model"
      class="flex items-start justify-end z-10 fixed inset-x-0 inset-y-0 bg-gray-900/70 hidden"
    >
      <div class="model bg-gray-800 h-screen" style="width: 85%">
        <div>
          <!-- Header -->
          <div class="flex items-center justify-between p-6">
            <div class="">
              <h4 class="text-gray-300 text-xl">Update Products</h4>
              <p class="text-gray-300 text-sm">
                Update products info, combinations and extras.
              </p>
            </div>

            <div class="flex items-center">
              <button
                class="close-btn focus:outline-none text-red-500 hover:bg-red-100 hover:text-gray-700 transition-colors duration-150 bg-white shadow-md w-10 h-10 rounded-full block text-center"
              >
                <svg
                  stroke="currentColor"
                  fill="none"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="mx-auto"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <line x1="18" y1="6" x2="6" y2="18"></line>
                  <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
              </button>
            </div>
          </div>
        </div>

        <!-- body -->
        <div class="bg-gray-700 h-screen overflow-scroll">
          <form action="" class="px-6 pt-8 pb-32">
            <!-- Product title -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Title/Name</label
              >
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Title/Name"
                />
              </div>
            </div>

            <!-- Product desc -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Description</label
              >
              <div class="col-span-4 col-start-3">
                <textarea
                  type="text"
                  class="w-full h-24 p-3 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Description"
                ></textarea>
              </div>
            </div>

            <!-- Product images -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Images</label
              >
              <div class="col-span-4 col-start-3">
                <div
                  class="flex flex-col items-center border-2 border-gray-600 border-dashed rounded-md cursor-pointer px-6 pt-5 pb-6"
                >
                  <!-- image input -->
                  <input
                    accept="image/*,.jpeg,.jpg,.png,.webp"
                    multiple=""
                    type="file"
                    style="display: none"
                  />
                  <span class="mx-auto flex justify-center">
                    <svg
                      stroke="currentColor"
                      fill="none"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="text-3xl text-emerald-500"
                      height="1em"
                      width="1em"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <polyline points="16 16 12 12 8 16"></polyline>
                      <line x1="12" y1="12" x2="12" y2="21"></line>
                      <path
                        d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"
                      ></path>
                      <polyline points="16 16 12 12 8 16"></polyline>
                    </svg>
                  </span>
                  <p class="text-sm mt-2 text-white mb-2">
                    Drag your images here
                  </p>
                  <em class="text-xs text-gray-400"
                    >(Only *.jpeg, *.webp and *.png images will be accepted)</em
                  >
                </div>

                <!-- image demo -->
                <div class="flex flex-row mt-4 space-x-2">
                  <!-- items -->
                  <div class="">
                    <div draggable="true">
                      <div class="relative">
                        <img
                          class="w-24 max-h-24 p-2 m-2 border border-md border-gray-600"
                          src="https://res.cloudinary.com/ahossain/image/upload/v1698532688/product/16459b778c47a519099b749b9c0ddfb4-removebg-preview.png"
                          alt=""
                        />
                        <p
                          class="absolute w-full py-1 text-xs text-white text-center inset-x-0 bottom-0 rounded-full bg-blue-500"
                        >
                          Default image
                        </p>
                        <button
                          type="button"
                          class="absolute -top-2 right-0 text-red-500 focus:outline-none"
                        >
                          <svg
                            stroke="currentColor"
                            fill="none"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            height="1em"
                            width="1em"
                            xmlns="http://www.w3.org/2000/svg"
                          >
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="15" y1="9" x2="9" y2="15"></line>
                            <line x1="9" y1="9" x2="15" y2="15"></line>
                          </svg>
                        </button>
                      </div>
                    </div>
                  </div>

                  <div class="">
                    <div draggable="true" class="">
                      <div class="relative">
                        <img
                          class="w-24 max-h-24 p-2 m-2 border border-md border-gray-600"
                          src="https://res.cloudinary.com/ahossain/image/upload/v1698532688/product/16459b778c47a519099b749b9c0ddfb4-removebg-preview.png"
                          alt=""
                        />
                        <p
                          class="absolute w-full py-1 text-xs text-white text-center inset-x-0 bottom-0 rounded-full bg-blue-500"
                        >
                          Default image
                        </p>
                        <button
                          type="button"
                          class="absolute -top-2 right-0 text-red-500 focus:outline-none"
                        >
                          <svg
                            stroke="currentColor"
                            fill="none"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            height="1em"
                            width="1em"
                            xmlns="http://www.w3.org/2000/svg"
                          >
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="15" y1="9" x2="9" y2="15"></line>
                            <line x1="9" y1="9" x2="15" y2="15"></line>
                          </svg>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Product category -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm"
                >Product Category</label
              >
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product Title/Name"
                />
              </div>
            </div>

            <!-- Product Price -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Price</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >$</span
                >
                <input
                  type="number"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Original Price"
                />
              </div>
            </div>

            <!-- Sale Price -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Product Price</label>
              <div class="flex flex-row col-span-4 col-start-3">
                <span
                  class="inline-flex items-center px-3 rounded rounded-r-none border-r-0 text-sm focus:border-emerald-300 bg-gray-700 text-gray-300 border border-gray-600"
                  >$</span
                >
                <input
                  type="number"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-tr-md rounded-br-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Sale Price"
                />
              </div>
            </div>

            <!-- Slug -->
            <div class="grid grid-cols-6 gap-6 mb-6">
              <label for="" class="text-slate-400 text-sm">Slug</label>
              <div class="col-span-4 col-start-3">
                <input
                  type="text"
                  class="w-full h-12 px-3 py-1 text-sm text-gray-300 leading-5 border border-gray-600 rounded-md bg-gray-700 focus:outline-none focus:border-gray-500"
                  placeholder="Product slug"
                />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</main>
    
    <jsp:include page="/views/partials/adminFooter.jsp" />

<script>
    const productModel = $("#product-edit-model");

    const closeBtn = $(".close-btn");

    const editBtns = $(".edit-btn");
    
    const deleteBtns = $(".delete-btn");

    closeBtn.click(function (e) {
      productModel.addClass("hidden");
    });

    editBtns.click(function (e) {
      productModel.removeClass("hidden");
    });
</script>